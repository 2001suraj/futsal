// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:futsal/provider/bottom_nav_bar_provider.dart';

import 'package:provider/provider.dart';

class ButtonNavBarScreen extends StatelessWidget {
  static const String routeName = '/Button_Nav_bar_Screen';
  const ButtonNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavBarProvider navBarProvider =
        Provider.of<BottomNavBarProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: navBarProvider.screen.elementAt(navBarProvider.currentScreen),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.amber[200],
          currentIndex: navBarProvider.currentScreen,
          onTap: navBarProvider.changeScreen,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_rounded),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
