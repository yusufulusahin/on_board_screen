import 'package:flutter/material.dart';
import 'package:on_board_screen/core/base/constants/enum/app_theme_enum.dart';
import 'package:on_board_screen/core/base/init/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTeheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTeheme;

  void changeTheme(AppThemes themes) {
    switch (themes) {
      case AppThemes.LIGHT:
        _currentTeheme = ThemeData.light();
        break;
      case AppThemes.DARK:
        _currentTeheme = ThemeData.dark();
        break;
    }
    notifyListeners();
  }
}
