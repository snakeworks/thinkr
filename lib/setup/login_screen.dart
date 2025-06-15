import 'package:flutter/material.dart';
import 'package:thinkr/dashboard/dashboard_screen.dart';
import 'package:thinkr/helper_widgets/th_button.dart';
import 'package:thinkr/utils/auth.dart';
import 'package:thinkr/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoggingIn = false;
  String _errorText = "";

  void _tryLogin() async {
    setState(() {
      _isLoggingIn = true;
      _errorText = "";
    });
    bool result = await Auth.login(_usernameController.text.trim(), _passwordController.text.trim());
    setState(() {
      _isLoggingIn = false;
      _errorText = "";
    });
    if (result) {
      Navigator.of(context).pushReplacement(
        Routes.asDefault(
          DashboardScreen()
        )
      );
    } else {
      setState(() {
        _errorText = "Failed to login.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ThButton(
              onPressed: _tryLogin,
              text: 'Login',
              isLoading: _isLoggingIn,
            ),
            const SizedBox(height: 24),
            Text(
              _errorText,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
