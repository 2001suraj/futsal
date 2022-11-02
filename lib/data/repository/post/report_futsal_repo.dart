// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;



class ReportFutsalRepo {
  Future<void> reportFutsalrepo({
    required String futsal_id,
    required String userid,
    required String issue_id,
    required String message,
    required BuildContext context,
  }) async {
    try {
      http.Response response = await http.post(
          Uri.parse(Constants.baseUrl + Constants.reportFutsal),
          headers: {
            Constants.ApiKey: Constants.ApiKeyValue,
          },
          body: {
            'user_id': userid,
            'futsal_id': futsal_id,
            'issue_id': issue_id,
            'message': message,
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(response.statusCode);
        Navigator.pop(context);
        print(' successfully reported');
      } else {
        print(response.body);
      }
    } catch (e) {
      showSnackBar(e.toString(), context, color: Colors.red);
      print(e.toString());
    }
  }
}
