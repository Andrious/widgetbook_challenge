///
import 'package:fluttery_framework/controller.dart' as c;
import 'package:fluttery_framework/view.dart';

///
class AppController extends c.AppController {
  /// Singleton pattern
  factory AppController() => _this ??= AppController._();
  AppController._();
  static AppController? _this;

  /// Simply toggle the
  void toggleThemeMode() {
    currentThemeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    setState(() {}); // Calls the 'AppState' object
  }

  ///
  ThemeMode get currentThemeMode => _themeMode;
  set currentThemeMode(ThemeMode? mode) {
    if (mode != null && mode != _themeMode) {
      _themeMode = mode;
    }
  }

  ThemeMode _themeMode = ThemeMode.light;
}
