// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:futsal/data/model/home_slider_model.dart';

import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class HomSliderRepo {
  Future<HomeSliderModel>? model;
  Future<HomeSliderModel> homSliderRepo() async {
    final response = await http.get(
      Uri.parse(Constants.baseUrl + Constants.homeSlider),
      headers: {
        Constants.ApiKey: Constants.ApiKeyValue,
        'Connection': 'keep-alive'
      },
    );
    var data = jsonDecode(response.body);
    try {
      print(data.toString());

      if (response.statusCode == 200) {
        return HomeSliderModel.fromJson(data);
      }
    } catch (error) {
      print('some error occured');
    }

    return model!;
  }
}
