// ignore_for_file: prefer_final_fields, avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:futsal/data/local_data/shared_pref.dart';
import 'package:futsal/data/model/user_login_model.dart';
import 'package:futsal/data/repository/post/login_repo.dart';
import 'package:futsal/helper/show_snackbar.dart';
import 'package:futsal/view/screen/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';

class LoginProvider extends ChangeNotifier {
  LoginRepo loginRepo;
  LoginProvider({required this.loginRepo});
  TextEditingController _mobileNo = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _isloading = false;

  TextEditingController get mobileNo => _mobileNo;
  TextEditingController get password => _password;
  bool get isloading => _isloading;

  LoginPreferences loginPreferences = LoginPreferences();

  userLogin(
      {required context,
      required String mobile_no,
      required String password}) async {
    if (_isloading == false) {
      _isloading == true;
      notifyListeners();
    }

    UserLoginModel apiresponse = await loginRepo.loginRepo(
        context: context, mobile_no: mobile_no, password: password);
    // print(apiresponse.userData!.address);
    if (apiresponse.statusCode == 200) {
      loginPreferences.setloginCache(mobile_no, password).whenComplete(() {
        showSnackBar('welcome', context, color: Colors.green);
        // print(loginPreferences);
        Navigator.pushReplacementNamed(context, ButtonNavBarScreen.routeName);
      });
    } else if (mobile_no.toString().isEmpty) {
      showSnackBar('mobile number can\'t be null', context, color: Colors.red);
    } else if (password.toString().isEmpty) {
      showSnackBar(' password can\'t be null', context, color: Colors.red);
    } else if (mobile_no.toString().isEmpty && password.toString().isEmpty) {
      showSnackBar('mobile number or password can\'t be null', context,
          color: Colors.red);
    } else {
      showSnackBar('Invalid password or mobile no , Please try again', context,
          color: Colors.red);
    }
     if (_isloading == true) {
      _isloading == false;
      notifyListeners();
    }
    notifyListeners();
  }

  UserDataModel? user() {
    return loginRepo.getUser();
  }
}
