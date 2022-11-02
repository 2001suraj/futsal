// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
Widget buildMenuItem({text, icon, ontap, sub}) {
  final color = Color.fromARGB(255, 14, 13, 13);
  return ListTile(
    contentPadding: EdgeInsets.only(top: 5),
    leading: Padding(
      padding: const EdgeInsets.only(bottom: 28.0, left: 10),
      child: Icon(icon, color: color),
    ),
    title: Text(text, style: TextStyle(color: color)),
    subtitle: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('${sub}', style: TextStyle(fontSize: 13)),
    ),
    onTap: ontap,
  );
}