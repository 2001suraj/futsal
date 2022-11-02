// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:futsal/provider/follow_futsal_provider.dart';
import 'package:futsal/provider/forget_password_provider.dart';
import 'package:futsal/provider/reset_password_provider.dart';
import 'package:futsal/provider/selected_futsal.dart';
import 'package:provider/provider.dart';

import 'package:futsal/locator.dart' ; 
import 'package:futsal/provider/bottom_nav_bar_provider.dart';
import 'package:futsal/provider/check_box_provider.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:futsal/provider/signup_provider.dart';
import 'package:futsal/routes.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locators <LoginProvider>()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => CheckBoxProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (_) => FollowFutsalProvider()),
        ChangeNotifierProvider(create: (_) => SelectedFutsalProvider()),
        ChangeNotifierProvider(create: (_)=> ForgetPasswordProvider()),

        ChangeNotifierProvider(create: (_)=>  ResetPasswordProvider
          ()),



        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Futsal ',
        theme: ThemeData.light().copyWith(
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black)
          
        
        ),
        initialRoute: SplashScreenRoute,
        // initialRoute: LoginScreenRoute,
        routes: routeScreen,
        // home: LoginScreen(),
        // home: HomeScreen(),
      ),
    );
  }
}
