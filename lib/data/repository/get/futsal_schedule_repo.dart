// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:futsal/data/model/futsal_schedule_model.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class FutsalScheduleRepo {
  Future<FutsalScheduleModel> futsalScheduleRepo({
    required int futsal_id,
    required DateTime date,
    required int ground_id,
    required BuildContext context,
  }) async {
    final response = await http.get(
      Uri.parse(
          'https://futsalsansar.com/api/Management/searchScheduleByDateAndGround?futsal_id=$futsal_id&ground_id=$ground_id&date=$date'),
          // 'https://futsalsansar.com/api/Management/searchScheduleByDateAndGround?futsal_id=$futsal_id&ground_id=$ground_id&date=2022-10-17'),

      headers: {
        Constants.ApiKey: Constants.ApiKeyValue,
      },
    );
    var data = jsonDecode(response.body);
    try {
      print(data.toString());

      if (response.statusCode == 200) {
        return FutsalScheduleModel.fromJson(data);
      } else if (response.statusCode == 403) {
        showSnackBar('No schedule found', context, color: Colors.orange);
      }
    } catch (error) {
      print('some error occured');
    }

    throw Center(child: CircularProgressIndicator());
  }
}
