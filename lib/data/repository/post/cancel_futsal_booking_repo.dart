// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/routes.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;



class CancelFutsalBookingRepo {
  Future<void> cancelFutsalBookingrepo({
    required String userid,
    required String booking_id,
    required BuildContext context,
  }) async {
    try {
      http.Response response = await http.post(
          Uri.parse(Constants.baseUrl + Constants.cancelFutsalBooking),
          headers: {
            Constants.ApiKey: Constants.ApiKeyValue,
          },
          body: {
            'user_id': userid,
            'booking_id': booking_id
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(response.statusCode);

        Navigator.pushReplacementNamed(context, UserBookedFutsalistRoute);
            showSnackBar(
            'Futsal cancelled successfullly',
            context,
            color: Colors.lightGreen);
      } else {
        print(response.body);
        Navigator.pop(context);
        showSnackBar(
            'Booking Cancellation must be done before 2 hours  of game time',
            context,
            color: Colors.blueGrey);
      }
    } catch (e) {
      showSnackBar(e.toString(), context, color: Colors.red);
      print(e.toString());
    }
  }
}
