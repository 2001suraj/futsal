// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

TextField icontextField({required controller}) {
  return TextField(
    style: TextStyle(color: Colors.black,letterSpacing: 2),
    showCursor: true,
    // autofocus: true,
    controller: controller,
    decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),),
        prefixIcon: SizedBox(
          width: 105,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image(
                width: 25,
                height: 25,
                image: AssetImage('assets/images/nepal.png'),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text("+977 - ", style: TextStyle(fontSize: 16,color: Colors.black,letterSpacing: 2),),
              )
            ],
          ),
        ),
),
  );
}
