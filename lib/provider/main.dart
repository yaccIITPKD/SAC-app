import '../exports.dart';

class GlobalDataProvider extends ChangeNotifier {
  ThemeData currentTheme = AppTheme.light();

  void toggleTheme() {
    currentTheme = currentTheme.brightness == Brightness.light
        ? AppTheme.dark()
        : AppTheme.light();
    notifyListeners();
  }
}
