import 'package:flutter/material.dart';
import 'package:thinkr/helper_widgets/th_button.dart';

class SettingsDashboard extends StatefulWidget {
  const SettingsDashboard({super.key});

  @override
  State<SettingsDashboard> createState() => _SettingsDashboardState();
}

class _SettingsDashboardState extends State<SettingsDashboard> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _locationAccess = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SwitchListTile(
          title: const Text('Enable Notifications'),
          value: _notificationsEnabled,
          onChanged: (bool value) {
            setState(() {
              _notificationsEnabled = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: _darkModeEnabled,
          onChanged: (bool value) {
            setState(() {
              _darkModeEnabled = value;
            });
          },
        ),
        SwitchListTile(
          title: const Text('Location Access'),
          value: _locationAccess,
          onChanged: (bool value) {
            setState(() {
              _locationAccess = value;
            });
          },
        ),
        ListTile(
          title: const Text('Change Password'),
          trailing: ThButton(
            onPressed: () {},
            text: 'Change',
          ),
        ),
      ],
    );
  }
}
