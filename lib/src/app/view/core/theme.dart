///
import 'package:google_fonts/google_fonts.dart';

import 'package:widgetbook_challenge/src/view.dart';

/// main app custom [Theme]
class AppTheme {
  /// Singleton pattern. Only one instance of this class.
  factory AppTheme() => _this ??= AppTheme._();
  AppTheme._();
  static AppTheme? _this;
  static final AppColors _appColors = AppColors();

  static final _lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: _appColors.kDarkModeFillColor,
    ),
    displayLarge: GoogleFonts.quicksand(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: _appColors.kDarkModeFillColor,
    ),
    displayMedium: GoogleFonts.quicksand(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: _appColors.kDarkModeFillColor,
    ),
    displaySmall: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: _appColors.kDarkModeFillColor,
    ),
    titleLarge: GoogleFonts.quicksand(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: _appColors.kDarkModeFillColor,
    ),
    labelLarge: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: _appColors.kMainColor,
    ),
  );

  static final _darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: _appColors.kWhiteColor,
    ),
    displayLarge: GoogleFonts.quicksand(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: _appColors.kWhiteColor,
    ),
    displayMedium: GoogleFonts.quicksand(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: _appColors.kWhiteColor,
    ),
    displaySmall: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: _appColors.kWhiteColor,
    ),
    titleLarge: GoogleFonts.quicksand(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: _appColors.kWhiteColor,
    ),
    labelLarge: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: _appColors.kMainColor,
    ),
  );

  final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: _darkTextTheme,
    scaffoldBackgroundColor: _appColors.kDarkModeColor,
    primaryIconTheme: IconThemeData(color: _appColors.kShadeColor),
    buttonTheme: ButtonThemeData(buttonColor: _appColors.kMainColor),
    appBarTheme: AppBarTheme(color: _appColors.kMainColor),
  );

  final _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: _appColors.kBackgroundColor,
    textTheme: _lightTextTheme,
    primaryIconTheme: IconThemeData(color: _appColors.kShadeColor),
    buttonTheme: ButtonThemeData(buttonColor: _appColors.kMainColor),
    appBarTheme: AppBarTheme(color: _appColors.kMainColor),
  );

  /// global app [ThemeData] in light mode
  ThemeData get light => _lightTheme;

  /// global app [ThemeData] in dark mode
  ThemeData get dark => _darkTheme;
}
