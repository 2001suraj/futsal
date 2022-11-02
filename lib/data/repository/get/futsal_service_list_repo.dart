// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:futsal/data/model/futsal_service_list.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class FutsalServiceListRepo {
  Future<FutsalServiceListModel> futsalServiceListRepo() async {
    final response = await http.get(
      Uri.parse(
          'https://futsalsansar.com/api/FutsalApi/servicesList?futsal_id=1'),
      headers: {
      Constants.ApiKey : Constants.ApiKeyValue,

      
      'Connection':'keep-alive'},
    );
    var data = jsonDecode(response.body);
    try {
        print(data.toString());

      if (response.statusCode == 200) {
        return FutsalServiceListModel.fromJson(data);
      }
    } catch (error) {

      print('some error occured');
    }

    throw 'error';
  }
}
