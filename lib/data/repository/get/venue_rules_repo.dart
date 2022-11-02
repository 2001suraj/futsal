// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:futsal/data/model/venue_rule_model.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class VenuRuleRepo {
  Future<VenueRuleModel> venuRuleRepo() async {
    final response = await http.get(
      Uri.parse(
          'https://futsalsansar.com/api/FutsalApi/venueRules?futsal_id=1'),
      headers: {
      Constants.ApiKey : Constants.ApiKeyValue,
      
      'Connection':'keep-alive'},
    );
    var data = jsonDecode(response.body);
    try {
        print(data.toString());

      if (response.statusCode == 200) {
        return VenueRuleModel.fromJson(data);
      }
    } catch (error) {

      print('some error occured');
    }

    throw 'error';
  }
}
