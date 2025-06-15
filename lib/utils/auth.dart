import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thinkr/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:thinkr/utils/storage_strings.dart';

class Auth {
  static UserModel? currentUser;
  
  static final String usersApiUrl = "https://684e879bf0c9c9848d2860c1.mockapi.io/api/v1/users";

  static Future<bool> login(String username, String password) async {
    final storage = FlutterSecureStorage();
    final response = await http.get(Uri.parse(usersApiUrl));
    if (response.statusCode == 200) {
      final List users = json.decode(response.body);
      final user = users.firstWhere(
        (u) => u['username'] == username && u['password'] == password,
        orElse: () => null,
      );
      if (user != null) {
        currentUser = UserModel.fromMap(user);
        await storage.write(key: StorageStrings.username, value: username);
        await storage.write(key: StorageStrings.password, value: password);
        return true;
      } else {
        currentUser = null;
        return false;
      }
    } else {
      currentUser = null;
      return false;
    }
  }

  static Future<void> logout() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: StorageStrings.username, value: '');
    await storage.write(key: StorageStrings.password, value: '');
  }
}