import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webuzz/core/theme/app_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final SharedPreferences _sharedPreferences;
  ThemeCubit(this._sharedPreferences) : super(_lightTheme) {
    _loadTheme();
  }

  static final _lightTheme = AppTheme.appLightTheme;
  static final _darkTheme = AppTheme.appDarkTheme;

  void toggleTheme() async {
   

    if (state.brightness == Brightness.dark) {
      emit(_lightTheme);
      _sharedPreferences.setBool('isDarkMode', false);
    } else {
      emit(_darkTheme);
      _sharedPreferences.setBool('isDarkMode', true);
    }
  }

  void _loadTheme() async {
   
    final isDarkMode = _sharedPreferences.getBool('isDarkMode') ?? true;

    if (isDarkMode) {
      emit(_darkTheme);
    } else {
      emit(_lightTheme);
    }
  }
}
