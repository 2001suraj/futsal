// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:futsal/data/model/near_by_futsal_list.dart';
import 'package:futsal/data/repository/get/near_by_futsal_list_repo.dart';

Expanded near_by_futsal_list() {
  return Expanded(
     
    child: FutureBuilder<NearByFutaslListModel>(
      future: NearByFutsalListRepo().nearbyFutsalListrepo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
             itemCount: snapshot.data!.data!.length,
            itemBuilder: (context, index) {
            return Text('${snapshot.data!.data![index].areaId .toString()}');
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
