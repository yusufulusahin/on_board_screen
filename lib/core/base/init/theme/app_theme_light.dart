import 'package:flutter/material.dart';
import 'package:on_board_screen/core/base/init/theme/app_theme.dart';

class AppThemeLight extends AppTheme {
  static late final AppThemeLight _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData.light();
}
