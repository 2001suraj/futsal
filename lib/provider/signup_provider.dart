// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:futsal/data/repository/post/signup_repo.dart';
import 'package:futsal/data/repository/post/user_signup_verification_repo.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController _contact_number = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _full_name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _controller = TextEditingController();
  TextEditingController _user_id = TextEditingController();
  TextEditingController _auth_code = TextEditingController();

  TextEditingController get contact_number => _contact_number;
  TextEditingController get password => _password;
  TextEditingController get full_name => _full_name;
  TextEditingController get address => _address;
  TextEditingController get email => _email;
  TextEditingController get dob => _dob;
  TextEditingController get gender => _gender;
  TextEditingController get controller => _controller;
  TextEditingController get user_id => _user_id;
  TextEditingController get auth_code => _auth_code;

  sign(context) async {
    SignUpRepo().signuprepo(
        context: context,
        email: _email.text,
        password: _password.text,
        full_name: _full_name.text,
        address: _address.text,
        gender: _gender.text,
        contact_number: _contact_number.text,
        dob: _dob.text);
  }

  user_signup_vericicatin({required context, required String user_id, required String auth_code}) async {
    UserSignupVerificationRepo().userSignupVerificationRepo(
      user_id: user_id,
      auth_code: auth_code,
      context: context,
    );
  }
}
