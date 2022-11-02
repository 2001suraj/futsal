// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:futsal/view/screen/home_screen/home_screen.dart';
import 'package:http/http.dart' as http;

class UserSignupVerificationRepo {
  Future<void> userSignupVerificationRepo(
      {required String user_id,
      required String auth_code,
      required BuildContext context}) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
           Constants.baseUrl + Constants.signupVerification

          ),
          headers: {
      Constants.ApiKey : Constants.ApiKeyValue,

          },
          body: {
            'user_id': user_id,
            'auth_code': auth_code,
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(response.statusCode);
        print(response.body);

        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        showSnackBar('signup successfully', context, color: Colors.green);
      } else if(user_id.toString().isEmpty || auth_code.toString().isEmpty) {
        showSnackBar(
            'User_id or opt can\'t be null , PLease try again ', context,
            color: Colors.red);
      }
      else{
              showSnackBar(
            'Incorrect User_id or OTP code , PLease try again ', context,
            color: Colors.red);
      }
    } catch (e) {
      showSnackBar(e.toString(), context, color: Colors.red);
    }
  }
}
