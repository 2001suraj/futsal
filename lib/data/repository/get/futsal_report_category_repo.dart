// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:futsal/data/model/futsal_report_category_list.dart';

import 'package:futsal/utilities/constants.dart';
import 'package:http/http.dart' as http;

class FutsalReportCategoryRepo {
  Future<FutsalReportCategoryListModel> futsalReportCategoryRepo() async {
    final response = await http.get(
      Uri.parse(
           Constants.baseUrl + Constants.futsalReportCategory

          ),
      headers: {
      Constants.ApiKey : Constants.ApiKeyValue,

        },
    );
    var data = jsonDecode(response.body);
    try {
        print(data.toString());

      if (response.statusCode == 200) {
        return FutsalReportCategoryListModel.fromJson(data);
      }
    } catch (error) {

      print('some error occured');
    }

    throw 'error';
  }
}
