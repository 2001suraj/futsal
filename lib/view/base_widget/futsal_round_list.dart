// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:futsal/data/model/futsal_ground_list_model.dart';
import 'package:futsal/data/repository/get/futsal_ground_list_repo.dart';

SizedBox futsal_ground_list() {
  return SizedBox(
    width: double.infinity,
    height: 100,
    child: FutureBuilder<FutsalGroundListModel>(
      future: FutsalGroundListRepo().futsalGroundListRepo(futsal_id:9),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return
          Text(
                  '${snapshot.data!.userData![0].groundName.toString()}',
                  style: TextStyle(color: Colors.black),
                )
              ;
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}
