import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:thinkr/dashboard/dashboard_screen.dart';
import 'package:thinkr/screens/login_screen.dart';
import 'package:thinkr/utils/auth.dart';
import 'package:thinkr/utils/routes.dart';
import 'package:thinkr/utils/storage_strings.dart';

class BootScreen extends StatefulWidget {
  const BootScreen({super.key});

  @override
  State<BootScreen> createState() => _BootScreenState();
}

class _BootScreenState extends State<BootScreen> {
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  void checkAuth() async {
    await Future.delayed(const Duration(seconds: 1));

    final storage = FlutterSecureStorage();
    String? username = await storage.read(key: StorageStrings.username);
    String? password = await storage.read(key: StorageStrings.password);

    if (username == null || username.isEmpty || password == null || password.isEmpty) {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        Routes.asDefault(LoginScreen())
      );
    } else {
      bool result = await Auth.login(username, password);
      if (!mounted) return;
      if (result) {
        Navigator.of(context).push(
          Routes.asDefault(DashboardScreen())
        );
      } else {
          Navigator.of(context).pushReplacement(
            Routes.asDefault(LoginScreen())
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      ),
    );
  }
}