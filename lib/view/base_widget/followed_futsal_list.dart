// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:futsal/data/model/followed_futsal_list_model.dart';
import 'package:futsal/data/repository/get/followed_futsal_list_repo.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:provider/provider.dart';

Consumer<LoginProvider> followed_futsal_list() {
  return Consumer<LoginProvider>(
    builder: (context, value, child) => Expanded(
       flex:  1,
      child: FutureBuilder<FollowedFutsalListModel>(
        future: FollowedFutsalListRepo().followedFutsalListRepo(userid: value.user()!.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
               itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
              return Text('${snapshot.data!.data![index].futsalName.toString()}');
            });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),
  );
}
