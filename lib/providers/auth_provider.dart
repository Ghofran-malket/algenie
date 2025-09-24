import 'package:algenie/utils/auth_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AuthStorage _storage = AuthStorage();

  bool _isLoggedIn = false;
  String? _token;
  
  bool get isLoggedIn => _isLoggedIn;
  String? get token => _token;

  loadToken() async{
    _token = await _storage.getToken();
    _isLoggedIn = _token != null ;
    notifyListeners();
  }

}