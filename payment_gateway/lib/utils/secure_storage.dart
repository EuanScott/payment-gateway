import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// An abstract class for secure storage operations.
///
/// This class defines the methods for secure storage operations such as writing, reading, deleting,
/// deleting all, and reading all keys.
abstract class SecureStorage {
  Future<void> write(String key, String value);

  Future<String?> read(String key);

  Future<void> delete(String key);

  Future<void> deleteAll();

  Future<List<String>> readAllKeys();
}

class FlutterSecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> write(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }

  @override
  Future<List<String>> readAllKeys() {
    return _storage.readAll().then((Map<String, String> values) {
      return values.keys.toList();
    });
  }
}
