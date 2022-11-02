// ignore_for_file: constant_identifier_names, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../provider/reset_password_provider.dart';
class ResetPasswordScreen extends StatelessWidget {
  static const String  Routename = '/ResetPasswordScreen';
  const  ResetPasswordScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ResetPasswordProvider resetPasswordProvider = Provider.of<ResetPasswordProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
title: Text('Reset Password'),
         centerTitle:  true,
      ),
       body:
      Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
             controller: resetPasswordProvider.passowrdController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              prefixIcon: Icon(Icons.lock),
              hintText: 'New password'
               ,
              suffixIcon: Icon(Icons.visibility)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: resetPasswordProvider.cpasswordController,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(Icons.lock),
                hintText: 'Confirm Password'
                ,
                suffixIcon: Icon(Icons.visibility)
            ),
          ),
        ),
        MaterialButton(onPressed: (){
          ResetPasswordProvider().resetpassword(context,resetPasswordProvider.passowrdController.text,resetPasswordProvider.cpasswordController.text);
        },child: Text('Reset Password'),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.blueGrey,),
      ],),
    );
  }
}
