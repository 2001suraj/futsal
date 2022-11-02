// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futsal/data/model/user_login_model.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/utilities/constants.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  final SharedPreferences sharedPref;
  LoginRepo({required this.sharedPref});

  Future<UserLoginModel> loginRepo({
    required String mobile_no,
    required String password,
    required BuildContext context,
  }) async {
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
    // data.addAll(list);

    try {
      if (response.statusCode == 200) {
        // print(response.body);
        print(data);

        saveid(json.encode(data['user_data']));

        return UserLoginModel.fromJson(data);
      }
    } on SocketException catch (error) {
      showSnackBar(error.toString(), context, color: Colors.red);
    }
    return UserLoginModel.fromJson(data);
  }

  saveid(String id) async {
    await sharedPref.setString(Constants.id, id);
  }

  UserDataModel? getUser() {
    var userMap = sharedPref.getString(Constants.id);
    if (userMap == null) {
      return UserDataModel.fromJson(json.decode(userMap!));
    } else {
      return UserDataModel.fromJson(json.decode(userMap.toString()));
    }
  }
}
