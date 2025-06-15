import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:thinkr/helper_widgets/th_button.dart';
import 'package:thinkr/utils/storage_strings.dart';

class SettingsDashboard extends StatefulWidget {
  const SettingsDashboard({super.key});

  @override
  State<SettingsDashboard> createState() => _SettingsDashboardState();
}

class _SettingsDashboardState extends State<SettingsDashboard> {
  bool _isLoading = false;

  final Map<String, bool> _settings = {
    StorageStrings.notifications: true,
    StorageStrings.darkMode: false,
    StorageStrings.locationAccess: false,
  };

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    setState(() {
      _isLoading = true;
    });
    final storage = FlutterSecureStorage();
    for (var key in _settings.keys) {
      String? value = await storage.read(key: key);
      _settings[key] = value != null ? bool.parse(value) : _settings[key]!;
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _setOption(String key, bool value) async {
    final storage = FlutterSecureStorage();

    setState(() {
      _settings[key] = !_settings[key]!;
    });

    await storage.write(
      key: key,
      value: _settings[key].toString(),
    );
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
              value: _settings[StorageStrings.notifications] ?? false,
              onChanged: (bool value) {
                _setOption(StorageStrings.notifications, value);
              },
            ),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _settings[StorageStrings.darkMode] ?? false,
              onChanged: (bool value) {
                _setOption(StorageStrings.darkMode, value);
              },
            ),
            SwitchListTile(
              title: const Text('Location Access'),
              value: _settings[StorageStrings.locationAccess] ?? false,
              onChanged: (bool value) {
                _setOption(StorageStrings.locationAccess, value);
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
