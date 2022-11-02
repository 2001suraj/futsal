// ignore_for_file: empty_statements

import 'package:flutter/material.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:provider/provider.dart';

Consumer<LoginProvider> getUserData() {
  return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
    //user info
    var data = loginProvider.user()!;
    ;
    return Text(data.id.toString());
  });
}
