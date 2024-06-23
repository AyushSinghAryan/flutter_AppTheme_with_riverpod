// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:learning_dart/API/RiverPod/Themes/theme_class.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData _currentTheme;
  ThemeModel(
    this._currentTheme,
  );
  ThemeData get currentTheme => _currentTheme;

  void newLightTheme() {
    _currentTheme = AppThemes.lightTheme;
    notifyListeners();
  }

  void newDarkTheme() {
    _currentTheme = AppThemes.darkTheme;
    notifyListeners();
  }
}
