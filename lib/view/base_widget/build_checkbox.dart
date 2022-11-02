
import 'package:flutter/material.dart';
import 'package:futsal/provider/check_box_provider.dart';
import 'package:provider/provider.dart';
class BuildCheckBoxProvider extends StatelessWidget {
  const BuildCheckBoxProvider({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CheckBoxProvider checkProvider = Provider.of<CheckBoxProvider>(context);

    return Consumer(
      builder: (context, value, child) =>  Checkbox(
        value: checkProvider.check,
        activeColor: Colors.grey,
        onChanged: (check) {
          checkProvider.onChange(check);
        },
       
      ),
    );
  }
}