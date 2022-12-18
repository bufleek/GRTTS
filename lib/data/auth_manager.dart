import 'dart:convert';

import 'package:grtts/data/models/user.dart';
import 'package:grtts/data/repos/base_repo.dart';
import 'package:grtts/utils/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  AuthManager._();
  static AuthManager? _this;
  factory AuthManager() => _this ??= AuthManager._();
  bool isInitialized = false;
  bool isAuthenticated = false;
  User? user;
  final List<Function> _listeners = [];

  Future<void> initialize() async {
    if (!isInitialized) {
      final sp = await SharedPreferences.getInstance();
      final employeeId = sp.getString(PreferenceKeys.employee_id);
      if (employeeId != null && employeeId.isNotEmpty) {
        await identifyUser(employeeId);
      }
      isInitialized = true;
    }
  }

  void addListener(Function listener) => _listeners.add(listener);
  void removeListener(Function listener) => _listeners.remove(listener);
  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  Future<void> identifyUser(String employeeId) async {
    final baseRepo = BaseRepo();
    try {
      final response =
          await baseRepo.post("auth/", body: {"employee_id": employeeId});
      switch (response.statusCode) {
        case 200:
          user = User.fromJson(jsonDecode(response.body));
          isAuthenticated = user != null;
          notifyListeners();
          final sp = await SharedPreferences.getInstance();
          await sp.setString(
              PreferenceKeys.employee_id, user?.employeeId ?? "");
          break;
        default:
          break;
      }
    } catch (e) {
      baseRepo.printError("AuthRepo - identifyUser", e);
    }
  }
}
