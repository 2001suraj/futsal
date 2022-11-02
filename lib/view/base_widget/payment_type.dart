// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:futsal/data/model/payment_type_model.dart';
import 'package:futsal/data/repository/get/payment_type_repo.dart';

Expanded payment_type() {
  return Expanded(
     
    child: FutureBuilder<PaymentTypeModel>(
      future: PaymentTypeRepo().paymentTypeRepo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
             itemCount: snapshot.data!.data!.length,
            itemBuilder: (context, index) {
            return Text('${snapshot.data!.data![index].name .toString()}');
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
