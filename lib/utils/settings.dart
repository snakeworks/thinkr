import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:thinkr/utils/storage_strings.dart';

class Settings {
  static final Map<String, bool> _settings = {
    StorageStrings.notifications: true,
    StorageStrings.darkMode: false,
    StorageStrings.locationAccess: false,
  };

  static bool? get(String key) {
    return _settings[key];
  }

  static Future<void> toggle(String key) async {
    final storage = FlutterSecureStorage();
    _settings[key] = !_settings[key]!;
    await storage.write(
      key: key,
      value: _settings[key]!.toString(),
    );
  }

  static Future<void> load() async {
    final storage = FlutterSecureStorage();
    for (var key in _settings.keys) {
      String? value = await storage.read(key: key);
      _settings[key] = value != null ? bool.parse(value) : _settings[key]!;
    }
  }
}