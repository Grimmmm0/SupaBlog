import 'package:blogz/services/auth_service.dart';
import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;

  Future<void> signIn(String email, String password) async {
    isLoading = true; // Show loading indicator in the UI
    try {
      await _authService.signIn(email, password);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUp(String email, String password) async {
    isLoading = true;
    notifyListeners();
  }
}
