// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:futsal/view/screen/account_screen/account_screen.dart';
import 'package:futsal/view/screen/home_screen/home_screen.dart';
import 'package:futsal/view/screen/map_screen/map_screen.dart';


class BottomNavBarProvider extends ChangeNotifier {
  var _currentScreen = 0;
  get currentScreen => _currentScreen;
  List<Widget> screen = [
  HomeScreen(),
  MapScreen(),
  HomeScreen(),
  AccountScreen()

  ];


  void changeScreen(index) {
    _currentScreen = index;
    notifyListeners();
  }
}
