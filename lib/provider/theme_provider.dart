import 'package:flutter/material.dart';
import 'package:restoorder/provider/themes/darkmode.dart';
import 'package:restoorder/provider/themes/lightmode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    getThemeAtInit();
  }

  Future getThemeAtInit() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      bool? isDark = sharedPreferences.getBool("is_dark");
      if (isDark != null && isDark) {
        _themeData = darkMode;
      } else {
        _themeData = ligtMode;
      }
      notifyListeners();
    } catch (e) {
      ('Error getting theme: $e');
      notifyListeners();
    }
  }

  ThemeData _themeData = ligtMode;

  bool get isDark => themData == darkMode;
  ThemeData get themData {
    return _themeData;
  }

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(bool isDarkTheme) async {
    themeData = isDarkTheme ? darkMode : ligtMode;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("is_dark", _themeData == darkMode);
  }
}
