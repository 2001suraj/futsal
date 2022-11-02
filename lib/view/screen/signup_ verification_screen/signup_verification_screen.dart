// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:futsal/provider/login_provider.dart';
import 'package:futsal/provider/signup_provider.dart';
import 'package:provider/provider.dart';

class SignUpVerificationScreen extends StatelessWidget {
  static const String routeName = '/Signup_Verification_Screen_Route';

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 400,
             margin: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
            color: Colors.white60,
             borderRadius: BorderRadius.circular( 20),

              border: Border.all(color: Colors.black),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter your OTP',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                 
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    width: double.infinity,
                    height: 80,
                    child: Center(
                      child: TextField(
                        controller: signUpProvider.auth_code,
                        decoration: InputDecoration(
                          fillColor: Colors.blueGrey,
                          hintText: 'Enter your OTP',
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        child: Text('Re-send OTP'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.blue,
                      ),
                      Consumer<LoginProvider>(
                        builder: (context, value, child) => 
                         MaterialButton(
                          onPressed: () {
                            signUpProvider.user_signup_vericicatin(
                                context: context,
                                user_id: value.user()!.id.toString(),
                                auth_code: signUpProvider.auth_code.text);
                          },
                          child: Text('Submit'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
