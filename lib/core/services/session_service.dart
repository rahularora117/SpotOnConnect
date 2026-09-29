import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/app_user.dart';

class SessionService {
  static const String _userKey = 'spoton_user';

  Future<void> saveUser(AppUser user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  Future<AppUser?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_userKey);

    if (raw == null) return null;

    return AppUser.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  Future<bool> hasUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userKey);
  }
}