// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class FollowFutsalRepo {
  //follow futsal 
  Future<void> followFutsalRepo({
    required String futsal_id,
    required String user_id,

    required BuildContext context,

  }) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            Constants.baseUrl+Constants.followFutsal,
          ),
          headers: {
      Constants.ApiKey : Constants.ApiKeyValue,

          },
          body: {
            'futsal_id': futsal_id,
            'user_id': user_id,

          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        // print(response.statusCode);

        print('follow successfully');

      } else {
        print(response.body);
      }
    } catch (e) {
      showSnackBar(e.toString(), context, color: Colors.red);
      print(e.toString());
    }
  }
  // unfollow futsal 

  Future<void> unfollowFutsalRepo({
    required String futsal_id,
    required String user_id,

    required BuildContext context,

  }) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            Constants.baseUrl+Constants.unfollowFutsal,
          ),
          headers: {
      Constants.ApiKey : Constants.ApiKeyValue,

          },
          body: {
            'futsal_id': futsal_id,
            'user_id': user_id,

          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        // print(response.statusCode);

        print('unfollow successfully');

      } else {
        print(response.body);
      }
    } catch (e) {
      showSnackBar(e.toString(), context, color: Colors.red);
      print(e.toString());
    }
  }
}
