import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  final _storage = const FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> saveToken(token) async{
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> deleteToken() async{
    await _storage.delete(key: _tokenKey);
  }

}