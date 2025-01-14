import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorage {
  static SharedPreferencesLocalStorage? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferencesLocalStorage> getInstance() async {
    _instance ??= SharedPreferencesLocalStorage();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future setBoolean(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  Future setInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }
 
  int? getInt(String key) {
    return _preferences?.getInt(key);
  }
  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  Future<bool>? clear() {
    return _preferences?.clear();
  }

}