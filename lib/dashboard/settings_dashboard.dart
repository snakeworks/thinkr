import 'package:flutter/material.dart';
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
          title: const Text('Enable Notifications'),
          value: Settings.get(StorageStrings.notifications) ?? false,
          onChanged: (bool value) {
            _toggle(StorageStrings.notifications);
          },
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: Settings.get(StorageStrings.darkMode) ?? false,
          onChanged: (bool value) {
            _toggle(StorageStrings.darkMode);
          },
        ),
        SwitchListTile(
          title: const Text('Location Access'),
          value: Settings.get(StorageStrings.locationAccess) ?? false,
          onChanged: (bool value) {
            _toggle(StorageStrings.locationAccess);
          },
        ),
        ListTile(
          title: const Text('Change Password'),
          trailing: ThButton(onPressed: () {}, text: 'Change'),
        ),
      ],
    );
  }
}
