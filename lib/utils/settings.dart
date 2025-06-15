import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:thinkr/utils/storage_strings.dart';

class Settings {
  static final Map<String, bool> _settings = {
    StorageStrings.notifications: true,
    StorageStrings.darkMode: false,
    StorageStrings.locationAccess: false,
  };

  static final Map<String, List<void Function(bool)>> _listeners = {};

  static bool? get(String key) {
    return _settings[key];
  }

  static Future<void> toggle(String key) async {
    final storage = FlutterSecureStorage();
    _settings[key] = !_settings[key]!;
    notifyListeners(key);
    await storage.write(
      key: key,
      value: _settings[key]!.toString(),
    );
  }
  static Future<void> load() async {
    final storage = FlutterSecureStorage();
    for (var key in _settings.keys) {
      String? value = await storage.read(key: key);
      _settings[key] = value != null ? value == 'true' : _settings[key]!;
      notifyListeners(key);
    }
  }

  static void addListener(String key, void Function(bool) func) {
    if (_listeners[key] == null) _listeners[key] = [];
    _listeners[key]!.add(func);
  }

  static void notifyListeners(String key) {
    if (_listeners[key] == null) return;
    for (var func in _listeners[key]!) {
      func(get(key) ?? false);
    }
  }
}