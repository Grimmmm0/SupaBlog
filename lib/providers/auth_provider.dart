import 'dart:async';
import 'package:blogz/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  String? errorMessage;
  Timer? _errorTimer;

  /// Current logged-in user
  User? get currentUser => _authService.currentUser;

  /// Returns true if a user is logged in
  bool get isAuthenticated => currentUser != null;

  void _setError(String message) {
    errorMessage = message;
    notifyListeners();

    _errorTimer?.cancel();
    _errorTimer = Timer(const Duration(seconds: 2), () {
      errorMessage = null;
      notifyListeners();
    });
  }

  /// Login
  Future<void> signIn(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _authService.signIn(email, password);
    } on AuthException catch (e) {
      _setError(e.message);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Register
  Future<void> signUp(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await _authService.signUp(email, password);
    } on AuthException catch (e) {
      _setError(e.message);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Logout
  Future<void> signOut() async {
    isLoading = true;
    notifyListeners();

    try {
      await _authService.signOut();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _errorTimer?.cancel();
    super.dispose();
  }
}
