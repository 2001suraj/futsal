// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:futsal/data/model/near_by_futsal_list.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class NearByFutsalListRepo {
  Future<NearByFutaslListModel>? nearbyFutsalListrepo() async {
    final response = await http.get(
      Uri.parse(
          'https://futsalsansar.com/api/Nearby/nearbyFutsalList?lat=85.3273417&long=27.7391559'),
      headers: {
      Constants.ApiKey : Constants.ApiKeyValue,


        },
    );
    var data = jsonDecode(response.body);
    try {
        print(data.toString());

      if (response.statusCode == 200) {
        return NearByFutaslListModel.fromJson(data);
      }
    } catch (error) {

      print('some error occured');
    }

    throw 'error';
  }
}
