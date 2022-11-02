// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class ChangePasswordRepo {
  Future<void> changePasswordRepo(
      {required String confirmpassword,
        required String password,
        required String userid,
        required BuildContext context}) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
              Constants.baseUrl + Constants.resetPassword

          ),
          headers: {
            Constants.ApiKey : Constants.ApiKeyValue,

          },
          body: {
            'confirm_password': confirmpassword,
            'password': password,
            'user_id' :userid
          });
      var data = jsonDecode(response.body.toString());


      if (response.statusCode == 200) {

        print(response.statusCode);
        print(response.body);
        showSnackBar(
            'password successfully changed', context,
            color: Colors.green);

      }
      else{

        showSnackBar(

            '  PLease try again ', context,
            color: Colors.red);
      }
    } catch (e) {
      showSnackBar(e.toString(), context, color: Colors.red);
    }
  }
}
