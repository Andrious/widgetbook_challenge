import 'package:flutter/material.dart';

/// main app [Theme] colors
class AppColors {
  /// Singleton pattern. Always one instance of the class
  factory AppColors() => _this ??= AppColors._();
  AppColors._();
  static AppColors? _this;

  /// light theme: main color
  final kWhiteColor = const Color(0xFFFCFCFC);

  /// light mode: main primary color
  final kMainColor = const Color(0xFF2A85FF);

  /// light mode: main [Scaffold] background color
  final kBackgroundColor = const Color(0xFFF4F4F4);

  /// light: ui shade color
  final kShadeColor = const Color(0xFF9A9FA5);

  /// light theme: [TextField] fill color
  final kTextFieldFillColor = const Color.fromARGB(255, 239, 239, 241);

  /// dark theme: main color
  final kDarkModeColor = const Color(0xFF1A1D1F);

  /// dark theme: [TextField] fill color
  final kDarkModeFillColor = const Color(0xFF111315);

  /// dark theme: [Text] fill color
  final kDarkModeTextFaintColor = const Color(0xFF272B30);

  /// general: preffered warning indicator
  final kOrangeIndicatorColor = const Color(0xFFFFBC99);

  /// general: preffered danger indicator for text
  final kRedIndicatorColor = const Color(0xFFFF6A55);

  /// general: preffered success indicator
  final kGreenIndicatorColor = const Color(0xFF83BF6E);
}
