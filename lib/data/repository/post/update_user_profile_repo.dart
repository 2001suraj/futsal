// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

import '../../../view/screen/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';

class UpdateUserProfileRepo {
  Future<void> updateUserProfilerepo({
    required String email,
    required String userid,
    required String full_name,
    required String address,
    required String gender,
    required String contact_number,
    required String dob,
    required BuildContext context,
  }) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
              Constants.baseUrl + Constants.updateUserProfile
          ),
          headers: {
            Constants.ApiKey : Constants.ApiKeyValue,


          },
          body: {
            'user_id': userid,
            'email': email,
            'full_name': full_name,
            'address': address,
            'dob': dob,
            'gender': gender,
            'contact_number': contact_number,
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(response.statusCode);

        print('user detail update successfully');
        Navigator.pushReplacementNamed(
            context,ButtonNavBarScreen.routeName);
      } else {
        print(response.body);
      }
    } catch (e) {
      showSnackBar(e.toString(), context, color: Colors.red);
      print(e.toString());
    }
  }
}
