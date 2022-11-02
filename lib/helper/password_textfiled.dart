// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:futsal/provider/check_box_provider.dart';
import 'package:provider/provider.dart';

class BuildPasswordTextField extends StatelessWidget {
  TextEditingController controller;
  BuildPasswordTextField({required this.controller});
  @override
  Widget build(BuildContext context) {
    CheckBoxProvider checkBoxProvider = Provider.of<CheckBoxProvider>(context);
    return TextField(
      style: TextStyle(color: Colors.black,letterSpacing: 2),
      showCursor: true,
      obscureText: checkBoxProvider.show ? true : false,
      controller: controller,
      decoration: InputDecoration(
        hintText: '********',
        hintStyle: TextStyle(color: Colors.grey,letterSpacing: 2),
        suffixIcon: SizedBox(
          height: 10,
           width:70,
          child: MaterialButton(
              onPressed: 
                checkBoxProvider.change
              ,
              child: checkBoxProvider.show ? Text("show",style: TextStyle(color: Colors.black),) : Text("hide",style: TextStyle(color: Colors.black),)),
        ),
        enabled: true,
         enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),

        ),
      ),
    );
  }
}
