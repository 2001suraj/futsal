// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class SelectedFutsalProvider extends ChangeNotifier {
  MaterialColor _availableColor = Colors.grey;
  MaterialColor _selectedColor = Colors.green;

  MaterialColor get availableColor => _availableColor;
  MaterialColor get selectedColor => _selectedColor;
  bool _isclicked = true;

  Color getColor(String event) {
  if (event == "Booked") return Colors.blue;
  if (event == "Not-Booked") return Colors.grey;
  return Colors.green;
}
  bool get isclicked => _isclicked;
   void onchange() {
    _isclicked = !_isclicked;

   
    notifyListeners();
  }
}
