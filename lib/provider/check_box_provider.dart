// ignore_for_file: prefer_final_fields

import 'package:flutter/widgets.dart';

class CheckBoxProvider extends ChangeNotifier {
  bool _check = false;
  bool _show = true;
  List<String> _gender = [
    '   Male  ',
    '   Female   ',
    '   Others   ',
  ];
  String? _selectedGender;

  bool get check => _check;
  bool get show => _show;
  String? get selectedGender => _selectedGender;

  List<String> get gender => _gender;

  void onChange(check) {
    // ignore: unnecessary_this
    this._check = check;
    notifyListeners();
  }

  void change() {
    _show = !_show;
    notifyListeners();
  }

  void genderChange(value) {
    _selectedGender = value as String?;
    notifyListeners();
  }
}
