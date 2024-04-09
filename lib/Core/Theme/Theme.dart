import 'package:flutter/material.dart';
import 'package:my_blogs/Core/Theme/Color_pallet.dart';

class AppTheme {
  static _border([Color color = ColorPallet.borderColor]) => OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: color),
      borderRadius: BorderRadius.circular(20));
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorPallet.backgroundColor,
    chipTheme: const ChipThemeData(
        color: MaterialStatePropertyAll(
          ColorPallet.backgroundColor,
        ),
        side: BorderSide.none),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(25),
      enabledBorder: _border(),
      focusedBorder: _border(ColorPallet.gradient2),
    ),
  );
}
