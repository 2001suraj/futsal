// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:futsal/data/model/user_booked_futsal_list_model.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class UserBookedFutsalListRepo {
  Future<UserBookedFutsalListModel> userBookedFutsalListRepo({
    required String user_id,
    required String status,
  }) async {
    final response = await http.get(
      Uri.parse(
          'https://futsalsansar.com/api/Management/userBookedFutsalList?user_id=$user_id&status=$status'),
      headers: {
        Constants.ApiKey: Constants.ApiKeyValue,
        'Connection': 'keep-alive'
      },
    );
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        return UserBookedFutsalListModel.fromJson(data);
        // print(response.body);
      }
    } catch (error) {
      print('some error occured');
    }

    throw 'error';
  }
}
