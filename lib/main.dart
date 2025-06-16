import 'package:flutter/material.dart';
import 'package:thinkr/screens/boot_screen.dart';
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder()     
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder()     
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
      debugShowCheckedModeBanner: false,
      home: BootScreen(),
    );
  }
}
