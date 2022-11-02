// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, unnecessary_brace_in_string_interps, camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/forget_password_provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/Forget_Screen_Route';

  ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController numbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ForgetPasswordProvider forgetPasswordProvider = Provider.of<ForgetPasswordProvider>(context,);

    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Oops !',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                    "Its ok to have forgetten your password. We'll help you reset it very easily"),
                SizedBox(height: 10),
                Text(" Enter the mobile number associated with your account and we'll send you a code to recover your password . "),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Mobile Number'),
                SizedBox(
                  height: 5,
                ),

                // email
                TextField(
                  showCursor: true,
                  autofocus: true,
                  controller: forgetPasswordProvider.mobileController,
                  decoration: InputDecoration(

                    prefixIcon: Icon(Icons.phone),
                      enabled: true,
                       hintText: '98XXXXXXXX',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(height: 20,),
                Text('Email'),
                SizedBox(
                  height: 5,
                ),
                //E-mail
                TextField(
                  showCursor: true,
                  autofocus: true,
                  controller: forgetPasswordProvider.emailController,
                  decoration: InputDecoration(
                     prefixIcon: Icon(Icons.email),
                      hintText: 'emample@gmail.com',
                      enabled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 38, left: 20, right: 20),
                  child: RaisedButton(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                      onPressed: () {
                        forgetPasswordProvider.forgetpassword(context);

                      },
                      child: Text('continue')),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


