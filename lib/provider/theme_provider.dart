import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeChecked = true;

  void updateThemeMode({required bool darkMode}) async {
    isDarkModeChecked = darkMode;
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isDarkMode", darkMode);
    notifyListeners();
  }

  void loadTheme() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    isDarkModeChecked = pref.getBool("isDarkMode") ?? true;
    notifyListeners();
  }
}
