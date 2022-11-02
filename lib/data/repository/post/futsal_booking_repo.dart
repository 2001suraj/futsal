// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/routes.dart';
import 'package:futsal/utilities/constants.dart';

import 'package:http/http.dart' as http;

class FutsalBookingRepo {
  Future<void> futsalBookingRepo({
    required String schedule_id,
    required String user_id,
    required String booking_date,
    // required List<Map<String, dynamic>> payment_detail,
    required String payment_detail,
    required BuildContext context,
  }) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            Constants.baseUrl + Constants.futsalBooking,
          ),
          headers: {
            Constants.ApiKey: Constants.ApiKeyValue,
          },
          body: {
            'schedule_id': schedule_id,
            'user_id': user_id,
            'booking_date': booking_date,
            'payment_detail': payment_detail,
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(response.statusCode);
        showSnackBar("Booked successfully", context, color: Colors.green);
        Navigator.pushNamedAndRemoveUntil(
            context, BottomNavBarScreenRoute, (route) => false);
        print(response.body);

        print(' booked successfully');
      } else {
        print(response.body);
      }
    } catch (e) {
      // print(response.body);
      showSnackBar(e.toString(), context, color: Colors.red);
      print(e.toString());
    }
  }
}
