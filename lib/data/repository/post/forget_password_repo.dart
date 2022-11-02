// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordRepo {
  Future<void> forgetPasswordRepo(
      {required String mobile,
        required String email,
        required BuildContext context}) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
              Constants.baseUrl + Constants.forgetPassword

          ),
          headers: {
            Constants.ApiKey : Constants.ApiKeyValue,

          },
          body: {
            'mobile': mobile,
            'email': email,
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(response.statusCode);
        print(response.body);
        showSnackBar(
            'password successfully changed', context,
            color: Colors.red);

      } else if(mobile.toString().isEmpty || email.toString().isEmpty) {
        showSnackBar(
            'mobile or email can\'t be null , PLease try again ', context,
            color: Colors.red);
      }
      else{
        showSnackBar(

            'Incorrect mobile or email , PLease try again ', context,
            color: Colors.red);
      }
    } catch (e) {
      showSnackBar("Check your email or message box for new password", context, color: Colors.green);
    }
  }
}
