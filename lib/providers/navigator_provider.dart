import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
