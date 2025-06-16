import 'package:flutter/material.dart';
import 'package:thinkr/helper_widgets/password_change_dialog.dart';
import 'package:thinkr/helper_widgets/th_button.dart';
import 'package:thinkr/utils/settings.dart';
import 'package:thinkr/utils/storage_strings.dart';

class SettingsDashboard extends StatefulWidget {
  const SettingsDashboard({super.key});

  @override
  State<SettingsDashboard> createState() => _SettingsDashboardState();
}

class _SettingsDashboardState extends State<SettingsDashboard> {
  void _toggle(String key) {
    setState(() {
      Settings.toggle(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: Settings.get(StorageStrings.darkMode) ?? false,
          onChanged: (bool value) {
            _toggle(StorageStrings.darkMode);
          },
        ),
        ListTile(
          title: const Text('Change Password'),
          trailing: ThButton(
            onPressed: () { showPasswordChangeDialog(context); }, 
            text: 'Change'
          ),
        ),
      ],
    );
  }
}
