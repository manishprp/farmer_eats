import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class Store {
  final _storage = GetIt.I<FlutterSecureStorage>();
  Future<void> storeToken(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> retrieveToken(String key) async {
    try {
      // Retrieve stored data securely
      return await _storage.read(key: key);
    } catch (e) {}
    return null;
  }
}
