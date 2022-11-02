// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';


import 'package:futsal/data/model/futsal_ground_list_model.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class FutsalGroundListRepo {
  Future<FutsalGroundListModel> futsalGroundListRepo({required int futsal_id}) async {
    final response = await http.get(
      Uri.parse(
           Constants.baseUrl +'Management/futsalgroundList?futsal_id=$futsal_id',

          ),
      headers: {
      Constants.ApiKey : Constants.ApiKeyValue,

      
      'Connection':'keep-alive'},
    );
    var data = jsonDecode(response.body);
    try {
        print(data.toString());

      if (response.statusCode == 200) {
        return FutsalGroundListModel.fromJson(data);
      }
    } catch (error) {

      print('some error occured');
    }

    throw 'error';
  }
}
