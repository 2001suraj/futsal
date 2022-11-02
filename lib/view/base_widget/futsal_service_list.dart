// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:futsal/data/model/futsal_service_list.dart';
import 'package:futsal/data/repository/get/futsal_service_list_repo.dart';


Container futsal_service_list() {
  return Container(
    width: double.infinity,
    child: 
       FutureBuilder<FutsalServiceListModel>(
        future: FutsalServiceListRepo().futsalServiceListRepo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.only(left: 40, right: 20, bottom: 10, top: 5),
              height: 240,
              child: Html(
                data: snapshot.data!.userData!.services.toString(),
                style: {
                  'p': Style(color: Colors.black, fontSize: FontSize.medium),
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    
  );
}
