import 'package:flutter/material.dart';
import 'package:thinkr/utils/auth.dart';

class PasswordChangeDialog extends StatefulWidget {
  const PasswordChangeDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordChangeDialogState createState() => _PasswordChangeDialogState();
}

class _PasswordChangeDialogState extends State<PasswordChangeDialog> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isSettingPassword = false;

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isSettingPassword = true;
      });
      String newPassword = _newPasswordController.text;

      await Auth.setPassword(newPassword);

      if (!mounted) return;

      setState(() {
        _isSettingPassword = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Change Password'),
      contentPadding: EdgeInsets.all(16.0),
      content: SizedBox(
        width: 400,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Old Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your old password';
                  }
                  if (value != Auth.currentUser!.password!) {
                    return 'Old password is not correct';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'New Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your new password';
                  }
                  if (value.length < 6) {
                    return 'Password should be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm New Password'),
                validator: (value) {
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: 
        !_isSettingPassword
        ? [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog without doing anything
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: _submit,
            child: Text('Submit'),
          ),
        ]
        : [
          CircularProgressIndicator()
        ]
    );
  }
}

void showPasswordChangeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return PasswordChangeDialog();
    },
  );
}
