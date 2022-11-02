// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:futsal/data/model/user_login_model.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class LoginDataRepo{

   Future<UserLoginModel> loginDataRepo(

    
      {required String mobile_no, required String password}) async {
    http.Response response = await http.post(
        Uri.parse(
          Constants.baseUrl + Constants.login,
        ),
        headers: {
          Constants.ApiKey: Constants.ApiKeyValue,
        },
        body: {
          'mobile_no': mobile_no,
          'password': password,
        });
    var data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
     
        print(data);
        return UserLoginModel.fromJson(data);
      }
    } catch (error) {
      print('some error occured');

    }
      throw '';
  }
}

 