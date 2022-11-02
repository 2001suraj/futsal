// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:futsal/data/model/futsal_report_category_list.dart';
import 'package:futsal/data/repository/get/futsal_report_category_repo.dart';

Expanded futsal_report_category() {
  return Expanded(
     
    child: FutureBuilder<FutsalReportCategoryListModel>(
      future: FutsalReportCategoryRepo().futsalReportCategoryRepo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
             itemCount: snapshot.data!.data!.length,
            itemBuilder: (context, index) {
            return Text('${snapshot.data!.data![index].issueName.toString()}');
          });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}
