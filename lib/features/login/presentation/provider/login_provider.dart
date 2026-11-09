import 'package:flutter/cupertino.dart';

import '../../domain/repo/login_repo.dart';

class LoginProvider extends ChangeNotifier{
  final LoginRepo _loginRepo;
  LoginProvider(this._loginRepo);
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login({required String email, required String password}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _isLoggedIn = await _loginRepo.login(email: email, password: password);
      if (_isLoggedIn) {
        _errorMessage = 'Invalid email or password';
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}