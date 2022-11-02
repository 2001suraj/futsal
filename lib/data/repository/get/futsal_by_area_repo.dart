// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';


import 'package:futsal/data/model/futsal_by_area_model.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class FustalByAreaRepo {
  Future<FutsalByAreaModel> fustalByAreaRepo({ required String area_id}) async {
    final response = await http.get(
      Uri.parse(
           '${Constants.baseUrl}FutsalApi/getFutsalDetailByArea?area_id=$area_id'

          ),
      headers: {
      Constants.ApiKey : Constants.ApiKeyValue,

      
      'Connection':'keep-alive'},
    );
    var data = jsonDecode(response.body);
    try {
        print(data.toString());

      if (response.statusCode == 200) {
        return FutsalByAreaModel.fromJson(data);
      }
    } catch (error) {

      print('some error occured');
    }

    throw 'error';
  }
}
