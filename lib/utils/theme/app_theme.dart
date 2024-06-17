import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    extensions: <ThemeExtension<dynamic>>[
      AppColors(),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    extensions: <ThemeExtension<dynamic>>[
      AppColors(),
    ],
  );
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  AppTheme() {
    final prefs = SharedPreferences.getInstance();
    prefs.then((storage) {
      final value = storage.get('themeMode');

      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeMode = ThemeMode.light;
        notifyListeners();
      } else {
        _themeMode = ThemeMode.dark;
        notifyListeners();
      }
    });
  }

  void toggleTheme() async {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    if (_themeMode == ThemeMode.light) {
      prefs.setString('themeMode', 'light');
    } else {
      prefs.setString('themeMode', 'dark');
    }
    notifyListeners();
  }
}
