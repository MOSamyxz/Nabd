import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  User? get currentUser => _client.auth.currentUser;

  Stream<AuthState> get authState => _client.auth.onAuthStateChange;

  Future<AuthResponse> signUpWithEmail(String email, String password) async {
    final response = await _client.auth.signUp(email: email, password: password);
    if (response.user == null) throw Exception("Sign up failed");
    return response;
  }

  Future<AuthResponse> signInWithEmail(String email, String password) async {
    final response = await _client.auth.signInWithPassword(email: email, password: password);
    if (response.user == null) throw Exception("Login failed");
    return response;
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}
