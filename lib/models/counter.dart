import 'package:flutter/material.dart';

class Counter extends ChangeNotifier
{   //Counter state
  int _count = 0;
  int get count => _count;

  void increment()
  {
    _count++;
    notifyListeners();
  }
}