import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageController {
  static final SecureStorageController _instance =
      SecureStorageController._internal();
  final String key = 'totp_secret';
  final _storage = const FlutterSecureStorage();

  factory SecureStorageController() {
    return _instance;
  }

  SecureStorageController._internal();

  Future<void> saveTOTPSecret(String value) {
    return _storage.write(
      key: key,
      value: value,
    );
  }

  Future<String?> readTOTPSecret() {
    return _storage.read(key: key);
  }
}
