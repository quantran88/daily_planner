import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
   Color _themeColor = Colors.blue;
  double _fontSize = 16.0;

  Color get themeColor => _themeColor;
  double get fontSize => _fontSize;

  void setThemeColor(Color color) {
    _themeColor = color;
    notifyListeners();
  }

  void setFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }
}
