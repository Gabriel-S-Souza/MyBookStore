import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage.dart';

class LocalStorageImp implements LocalStorage {
  late final SharedPreferences _prefs;

  LocalStorageImp(SharedPreferences prefs) : _prefs = prefs;

  @override
  Future<bool> delete({required String key}) => _prefs.remove(key);

  @override
  Future<bool> deleteAll() => _prefs.clear();

  @override
  String? get(String key) => _prefs.getString(key);

  @override
  Future<bool> set({required String key, required String value}) async =>
      _prefs.setString(key, value);
}
