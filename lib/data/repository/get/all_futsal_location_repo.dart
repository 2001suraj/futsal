// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:futsal/data/model/all_futsal_location_model.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class AllFutsalLocationRepo {
  Future<AllFutsalLocationModel>? model;
  Future<AllFutsalLocationModel> allFutsalLocationRepo() async {
    final response = await http.get(
      Uri.parse(Constants.baseUrl + Constants.allFutsalLocation),
      headers: {
        Constants.ApiKey: Constants.ApiKeyValue,
        'Connection': 'keep-alive'
      },
    );
    var data = jsonDecode(response.body);
    try {
      print(data.toString());

      if (response.statusCode == 200) {
        return AllFutsalLocationModel.fromJson(data);
      }
    } catch (error) {
      print('some error occured');
    }

    return model!;
  }
}
