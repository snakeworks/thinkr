import 'package:flutter/material.dart';
import 'package:thinkr/setup/boot_screen.dart';
import 'package:thinkr/utils/settings.dart';
import 'package:thinkr/utils/storage_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Settings.load();
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late bool _isDarkMode;

  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple,
      elevation: 2,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    )
  );

  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    primaryColor: Colors.deepPurple[200],
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple[700],
      elevation: 2,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    )
  );

  @override
  void initState() {
    super.initState();
    _isDarkMode = Settings.get(StorageStrings.darkMode) ?? false;
    Settings.addListener(StorageStrings.darkMode, (bool newValue) {
      setState(() {
        _isDarkMode = newValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thinkr',
      theme: _isDarkMode ? _darkTheme : _lightTheme,
      home: BootScreen(),
    );
  }
}
