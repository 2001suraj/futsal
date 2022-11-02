// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
 Row customRowbtnColor(color, text) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
          ),
        )
      ],
    );
  }