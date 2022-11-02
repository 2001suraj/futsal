// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:futsal/data/model/futsal_details_by_name_model.dart';
import 'package:futsal/data/repository/get/futsal_details_by_name_repo.dart';

Expanded futsal_details_by_name() {
  return Expanded(
    child: FutureBuilder<FutsalDetailsByNameModel>(
      future: FutsalDetailsByNameRepo().futsalDetailsByNameRepo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
            return Text('${snapshot.data!.data![0].futsalName .toString()}');
          
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}
