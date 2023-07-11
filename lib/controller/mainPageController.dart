import 'package:flutter/material.dart';

class MainPageController extends ChangeNotifier {
  int currentIndex = 0;

  void onPageChange(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
