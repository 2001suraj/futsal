// ignore_for_file: non_constant_identifier_names

import 'package:futsal/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPref;

  static initialize() async {
    sharedPref = await SharedPreferences.getInstance();
  }
}

class LoginPreferences {
  //.set  email and password
  Future setloginCache(String mobile_no, String pass) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString(Constants.mobile_no, mobile_no);
    preferences.setString(Constants.pass, pass);
  }

// get. email
  Future getloginCache(String mobile_no) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var cache = preferences.getString(Constants.mobile_no);
    return cache;
  }

  // get password
  Future getpassCache(String pass) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var cache = preferences.getString(Constants.pass);
    return cache;
  }

//remove
  Future removeloginCache() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.clear();
  }


}
