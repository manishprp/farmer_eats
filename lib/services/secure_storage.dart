import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class Store {
  late FlutterSecureStorage storage;

  Store() {
    storage = GetIt.I<FlutterSecureStorage>();
  }

  Future<void> storeToken(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> retrieveToken(String key) async {
    try {
      // Retrieve stored data securely
      return await storage.read(key: key);
    } catch (e) {}
    return null;
  }
}
