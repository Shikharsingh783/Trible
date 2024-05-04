import 'package:flutter/material.dart';
import 'package:trible/themes/dark_mode.dart';
import 'package:trible/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  //initially, ligthmode
  ThemeData _themeData = darkMode;

  //get theme
  ThemeData get themeData => _themeData;

  // is dark mode
  bool get isdarkMode => _themeData == darkMode;
  


  // set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    //update UI
    notifyListeners();
  }

  //toggle theme
  void toggleTheme() {
  if (_themeData == lightMode) {
    _themeData = darkMode;
  } else {
    _themeData = lightMode;
  }

  // update UI
  notifyListeners();
}
}