import '../exports.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = AppTheme.light;

  void toggleTheme() {
    currentTheme = currentTheme.brightness == Brightness.light
        ? AppTheme.dark
        : AppTheme.light;
    notifyListeners();
  }

  Color getAccentColor() {
    return currentTheme.brightness == Brightness.light
        ? primaryColor
        : primaryColorNight;
  }

  Color getOnSurfaceColor() {
    return currentTheme.brightness == Brightness.light
        ? onSurfaceColor
        : surfaceColor;
  }

  Color getSurfaceColor() {
    return currentTheme.brightness == Brightness.light
        ? surfaceColor
        : onSurfaceColor;
  }

  Color getNavigationBarIndicatorColor() {
    return currentTheme.brightness == Brightness.light
        ? surfaceColor.withOpacity(0.3)
        : primaryColorNight;
  }
}

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: surfaceColor,
        secondary: primaryColor,
        onSecondary: surfaceColor,
        error: Color.fromARGB(255, 255, 71, 71),
        onError: surfaceColor,
        background: surfaceColor,
        onBackground: onSurfaceColor,
        surface: surfaceColor,
        onSurface: onSurfaceColor),
  );

  static ThemeData dark = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: primaryColorNight,
          onPrimary: onSurfaceColor,
          secondary: primaryColorNight,
          onSecondary: onSurfaceColor,
          error: Color.fromARGB(255, 255, 167, 167),
          onError: onSurfaceColor,
          background: onSurfaceColor,
          onBackground: surfaceColor,
          surface: onSurfaceColor,
          onSurface: surfaceColor));
}
