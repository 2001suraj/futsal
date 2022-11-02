// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:futsal/data/local_data/shared_pref.dart';
import 'package:futsal/data/repository/get/all_futsal_location_repo.dart';
import 'package:futsal/data/repository/get/futsal_service_list_repo.dart';
import 'package:futsal/data/repository/get/home_slider_repo.dart';
import 'package:futsal/data/repository/post/login_data_repo.dart';
import 'package:futsal/view/screen/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:futsal/view/screen/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginPreferences loginPreferences = LoginPreferences();
  String password = '';
  String email = '';

  void getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    password = prefs.getString('pass')!;
    setState(() {});
  }

  void getemail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('mobile_no')!;
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    getdata();
    getemail();
    _navigatedToHomeScreen();
    _navigatedToHomeScreen1();
      HomSliderRepo().homSliderRepo();
       AllFutsalLocationRepo().allFutsalLocationRepo();
    LoginDataRepo().loginDataRepo(mobile_no: email, password: password);
    FutsalServiceListRepo().futsalServiceListRepo();
  }

  _navigatedToHomeScreen() async {
    loginPreferences
        .getloginCache(
      'mobile_no',
    )
        .then((value) {
      if (value != null) {
        return Timer(Duration(seconds: 2), () {
          print(value.toString());
          // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          Navigator.pushReplacementNamed(context, ButtonNavBarScreen.routeName);
        });
      } else {
        return Timer(Duration(seconds: 2), () {
          print(value.toString());

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      }
    });
  }

  _navigatedToHomeScreen1() async {
    loginPreferences
        .getpassCache(
      'pass',
    )
        .then((value) {
      if (value != null) {
        return Timer(Duration(seconds: 2), () {
          print(value.toString());
          // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          Navigator.pushReplacementNamed(context, ButtonNavBarScreen.routeName);
        });
      } else {
        return Timer(Duration(seconds: 2), () {
          print(value.toString());

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
    );
  }
}
