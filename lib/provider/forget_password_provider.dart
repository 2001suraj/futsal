// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import '../data/repository/post/forget_password_repo.dart';

class ForgetPasswordProvider extends ChangeNotifier{


  TextEditingController _mobileController = TextEditingController();
  TextEditingController _emailController = TextEditingController();


  TextEditingController  get  mobileController => _mobileController;
  TextEditingController  get  emailController => _emailController;



  forgetpassword(BuildContext context){

       ForgetPasswordRepo().forgetPasswordRepo(
           mobile: _mobileController.text,
           email: _emailController.text,
           context: context);

  }
}// Text(value.user()!.fullName.toString()),