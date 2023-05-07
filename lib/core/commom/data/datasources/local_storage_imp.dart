abstract class LocalStorage {
  String? get(String key);
  Future<bool> set({required String key, required String value});
  Future<bool> delete({required String key});
  Future<bool> deleteAll();
}
