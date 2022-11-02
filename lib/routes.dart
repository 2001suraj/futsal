// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:futsal/view/screen/account_screen/compoment/reset_password_screen.dart';
import 'package:futsal/view/screen/account_screen/compoment/update_info_screen.dart';
import 'package:futsal/view/screen/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:futsal/view/screen/forget_password_screen/forget_password_screen.dart';
import 'package:futsal/view/screen/futsal_by_area/futsal_by_area.dart';

import 'package:futsal/view/screen/home_screen/components/home_slider/components/venue_rules_screen.dart';
import 'package:futsal/view/screen/home_screen/home_screen.dart';
import 'package:futsal/view/screen/login_screen/login_screen.dart';
import 'package:futsal/view/screen/my_booking/my_booking_list.dart';
import 'package:futsal/view/screen/sign_up_screen/sign_up_next_screen.dart';
import 'package:futsal/view/screen/signup_%20verification_screen/signup_verification_screen.dart';
import 'package:futsal/view/screen/splash_screen/splash_screen.dart';

const String BottomNavBarScreenRoute = '/Button_Nav_bar_Screen';
const String LoginScreenRoute = '/Login_Screen_Route ';
const String SignUpScreenRoute = '/Sign_Screen_Route';
const String HomeScreenRoute = '/Home_Screen_Route';
const String SignupVerificationScreenRoute =
    '/Signup_Verification_Screen_Route';
const String ForgetPasswordScreenRoute = '/Forget_Screen_Route';
const String SplashScreenRoute = '/splash_screen_Route';

const String VenueRulesScreenRoute = '/Venue_Rules_screen';

const String UpdateInfoScreenRoute = '/updateInfoScreen';

const String ResetPasswordScreenRoute = '/ResetPasswordScreen';
const String UserBookedFutsalistRoute = '/MyBookingList';

final routeScreen = {
  BottomNavBarScreenRoute: (context) => ButtonNavBarScreen(),
  LoginScreenRoute: (context) => LoginScreen(),
  SignUpScreenRoute: (context) => SignUpNextScreen(),
  HomeScreenRoute: (context) => HomeScreen(),
  SignupVerificationScreenRoute: (context) => SignUpVerificationScreen(),
  ForgetPasswordScreenRoute: (context) => ForgetPasswordScreen(),
  SplashScreenRoute: (context) => SplashScreen(),
  VenueRulesScreenRoute: (context) => VenueRuleScreen(),
  UpdateInfoScreenRoute: (context) => UpdateInfoScreen(),
  ResetPasswordScreenRoute: (context) => ResetPasswordScreen(),
  UserBookedFutsalistRoute: (context) => MyBookingList(),
};
