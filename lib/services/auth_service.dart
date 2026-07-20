import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/supabase.dart';

class AuthService {
  /// Sign in
  Future<AuthResponse> signIn(String email, String password) async {
    return await SupabaseConfig.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// Sign up
  Future<AuthResponse> signUp(String email, String password) async {
    return await SupabaseConfig.client.auth.signUp(
      email: email,
      password: password,
    );
  }

  /// Sign out
  Future<void> signOut() async {
    await SupabaseConfig.client.auth.signOut();
  }

  /// Current user
  User? get currentUser => SupabaseConfig.client.auth.currentUser;

  /// Current session
  Session? get currentSession => SupabaseConfig.client.auth.currentSession;
}
