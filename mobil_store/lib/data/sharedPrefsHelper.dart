import 'dart:convert';

import 'package:mobil_store/login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  /*
  static Future<void> loginAdminSave(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('admin', value);
  }

  static Future<bool> loginAgminGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? temp = prefs.getBool('admin');
    if (temp != null) {
      return temp;
    } else {
      return false;
    }
  }*/

  static Future<void> saveUser(LoginData user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString("kullanici", userJson);
  }

  static Future<LoginData?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString("kullanici");
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return LoginData.fromjson(userMap);
    }
    return null;
  }
}
