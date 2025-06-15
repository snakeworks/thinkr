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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    setState(() {
      _isLoading = true;
    });
    await Settings.load();
    setState(() {
      _isLoading = false;
    });
  }

  void _toggle(String key) {
    setState(() {
      Settings.toggle(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: const CircularProgressIndicator())
        : ListView(
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
