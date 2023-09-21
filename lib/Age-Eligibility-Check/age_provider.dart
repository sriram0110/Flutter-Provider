import 'package:flutter/material.dart';

class AgeProvider extends ChangeNotifier {
  Color? _color;

  Color? get color => _color;

  int? _age;

  int? get age => _age;

  void isEligible(int age) {
    _age = age;
    if (age >= 18) {
      _color = Colors.greenAccent;
      notifyListeners();
    } else {
      _color = Colors.redAccent;
      notifyListeners();
    }
  }
}
