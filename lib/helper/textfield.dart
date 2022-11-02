// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
  TextField customTextField({ required controller , required hint}) {
    return TextField(
      style: TextStyle(color: Colors.black),
      showCursor: true,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),

        
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[300]),
         enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15))),
    );
  }