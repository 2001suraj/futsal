// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:futsal/provider/check_box_provider.dart';
import 'package:provider/provider.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckBoxProvider checkBoxProvider = Provider.of<CheckBoxProvider>(context);

    return Container(
      height: 50,
      // margin: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButton(
          focusColor: Colors.white,
          dropdownColor: Colors.white,
            underline: SizedBox(),
            isExpanded: true,
            iconEnabledColor: Colors.black,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.arrow_drop_down),
            items: checkBoxProvider.gender.map((valueItem) {
              return DropdownMenuItem
              (
                value: valueItem, child: Text(valueItem,style: TextStyle(color: Colors.black),));
            }).toList(),
            onChanged: (value) {
              checkBoxProvider.genderChange(value);
            },
            value: checkBoxProvider.selectedGender),
      ),
    );
  }
}
