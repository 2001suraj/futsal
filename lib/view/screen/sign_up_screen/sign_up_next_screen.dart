// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, override_on_non_overriding_member, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:futsal/helper/custom_text.dart';
import 'package:futsal/helper/data_time_picker.dart';
import 'package:futsal/helper/textfield.dart';

import 'package:futsal/provider/signup_provider.dart';
import 'package:futsal/view/base_widget/build_checkbox.dart';
import 'package:provider/provider.dart';

class SignUpNextScreen extends StatelessWidget {
  static const String routeName = '/Sign_Screen_Route';

  // @override
  // void initState() {
  //   datetimeController.text = " ";
  // }

  @override
  Widget build(BuildContext context) {
    SignUpProvider signUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add your info ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(text: 'Full name'),
                          SizedBox(height: 5),
                          customTextField(
                            controller: signUpProvider.full_name,
                            hint: 'enter your full name',
                          ),
                          SizedBox(height: 15),

                          customText(text: 'Mobile number'),

                          SizedBox(height: 5),
                          customTextField(
                            controller: signUpProvider.contact_number,
                            hint: 'mobile number',
                          ),

                          // icontextField(controller: numbercontroller),
                          SizedBox(height: 15),

                          customText(text: 'E-mail'),

                          SizedBox(height: 5),
                          customTextField(
                            controller: signUpProvider.email,
                            hint: 'email',
                          ),
                          SizedBox(height: 15),
                          customText(text: 'Gender'),

                          SizedBox(height: 5),
                          // selecting gender
                          customTextField(
                            controller: signUpProvider.gender,
                            hint: 'gender',
                          ),

                          // SelectGender(),

                          //address
                          SizedBox(height: 15),

                          customText(text: 'Address'),

                          SizedBox(height: 5),
                          customTextField(
                            controller: signUpProvider.address,
                            hint: 'current address',
                          ),
                          SizedBox(height: 15),
                          //date of birth
                          customText(text: 'Date fo Birth'),

                          SizedBox(height: 5),

                          DateTimePicker(controller: signUpProvider.dob),

                         
                          SizedBox(height: 15),

                          customText(text: 'Password'),

                          SizedBox(height: 5),
                          customTextField(
                            controller: signUpProvider.password,
                            hint: 'password',
                          ),
                        ],
                      )),

                  // passwordTextField(controller: signUpProvider.password),
                  SizedBox(height: 35),

                  customText(text: 'Policy'),

                  SizedBox(height: 15),
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                              "Our policies help us  provide the full 'play expericene ' to our customer. please check the box to proceed further "),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 28.0, right: 38, bottom: 8),
                          child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.indigo[200],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  //  from view widgets checkbox_provider widget
                                  BuildCheckBoxProvider(),
                                  Text(
                                    " I agree T&C and Policies",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(top: 28, left: 40, right: 20),
                    child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        onPressed: () {
                          signUpProvider.sign(context);
                        },
                        child: Text('continue')),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
