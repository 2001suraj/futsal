// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:futsal/helper/custom_text.dart';

import 'package:futsal/helper/icon_textfield.dart';
import 'package:futsal/helper/password_textfiled.dart';
import 'package:futsal/provider/login_provider.dart';

import 'package:futsal/view/screen/forget_password_screen/forget_password_screen.dart';
import 'package:futsal/view/screen/sign_up_screen/sign_up_next_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/Login_Screen_Route';

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Consumer<LoginProvider>(
                builder: (context, provider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Heyy!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Great to have you back. Sign In to access all the tools that we've  developed for you. Enjoy playing",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Image(
                            image: AssetImage('assets/images/5.png'),
                            width: 120,
                            height: 200,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 38.0),
                          child: Image(
                            image: AssetImage('assets/images/user.png'),
                            width: 120,
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(text: 'Mobile Number'),
                          SizedBox(
                            height: 5,
                          ),
                          icontextField(controller: provider.mobileNo),
                          SizedBox(
                            height: 15,
                          ),
                          customText(text: 'Password'),
                          SizedBox(
                            height: 5,
                          ),
                          BuildPasswordTextField(
                            controller: provider.password,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextButton(
                            child: Text('Forget you Password ?'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ForgetPasswordScreen()));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 28, left: 15, right: 10),
                            child: RaisedButton(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 20),
                                onPressed: () {
                                  setState(() {
                                    isloading = true;
                                    provider.userLogin(
                                        context: context,
                                        password: provider.password.text.trim(),
                                        mobile_no:
                                            provider.mobileNo.text.trim());

                                  });

                              
                                },
                                child: isloading == true
                                    ? Center(
                                        child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ))
                                    : Text('continue')),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" Don't have an account ?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 20, 3, 3),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignUpNextScreen.routeName);
                          },
                          child: Text(' create',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 176, 34),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
