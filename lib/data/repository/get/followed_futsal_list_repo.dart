// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:futsal/data/model/followed_futsal_list_model.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class FollowedFutsalListRepo {
  Future<FollowedFutsalListModel> followedFutsalListRepo({required String userid}) async {
    final response = await http.get(
      Uri.parse(

           '${Constants.baseUrl}FollowFutsal/getFollowedFutsal?user_id=$userid'

          ),
      headers: {
      Constants.ApiKey : Constants.ApiKeyValue,


      
      'Connection':'keep-alive'},
    );
    var data = jsonDecode(response.body);
    try {
        print(data.toString());

      if (response.statusCode == 200) {
        return FollowedFutsalListModel.fromJson(data);
      }
    } catch (error) {

      print('some error occured');
    }

    throw 'error';
  }
}
