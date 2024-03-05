import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = ThemeData.light();

  void toggleTheme() {
    currentTheme = currentTheme.brightness == Brightness.light
        ? ThemeData.dark()
        : ThemeData.light();
    notifyListeners();
  }
}
