// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../data/repository/post/change_password_repo.dart';
import 'login_provider.dart';

class ResetPasswordProvider extends ChangeNotifier {


  TextEditingController _passowrdController = TextEditingController();
  TextEditingController _cpasswordController = TextEditingController();


  TextEditingController get passowrdController => _passowrdController;

  TextEditingController get cpasswordController => _cpasswordController;


  resetpassword(BuildContext context, String password, String confirmpassword) {
    LoginProvider logi = Provider.of<LoginProvider>(context, listen: false);


      ChangePasswordRepo().changePasswordRepo(
          confirmpassword: password,
          password: confirmpassword,
          userid:logi.user()!.id.toString(),
          context: context);

    // else {
    //   showSnackBar('new password and confirm password must be same', context,
    //       color: Colors.red);
    // }
  }
} // Text(value.user()!.fullName.toString()),