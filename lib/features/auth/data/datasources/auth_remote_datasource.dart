
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../models/user_model.dart';
import 'dart:developer';
abstract class AuthRemoteDatasource {
  Future<UserModel> signUpUser({
    required String email,
    required String password,
    required String username,
        required String fullName,

    String? bio,
    DateTime? birthDate,
    Map<String, String>? socialLinks,
  });

  Future<UserModel> loginUser({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<UserModel?> getCurrentUser();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final supabase.SupabaseClient supabaseClient;
  AuthRemoteDatasourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signUpUser({
    required String email,
    required String password,
    required String username,
    required String fullName,
    String? bio,
    DateTime? birthDate,
    Map<String, String>? socialLinks,
  }) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,

    );
 log('Current UID: ${supabaseClient.auth.currentUser?.id}');

 final now = DateTime.now();
    final user = response.user;


    final userModel = UserModel(
      id: user?.id ?? '',
      email: user?.email ?? email,
      username: username,
      fullName: fullName,
      avatarUrl: '',
      bio: bio,
      birthDate: birthDate,
      joinedAt: now,
      socialLinks: socialLinks,
    );
            log(userModel.toMap().toString());
 await supabaseClient.from('users').insert(userModel.toMap());
    return userModel;
  }

  @override
  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = response.user;
    if (user == null) {
      throw Exception('User login failed');
    }

    final userData =
        await supabaseClient.from('users').select().eq('id', user.id).single();

    return UserModel.fromMap(userData);
  }

  @override
  Future<void> logout() async => await supabaseClient.auth.signOut();

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = supabaseClient.auth.currentUser;
    if (user == null) return null;

    final userData =
        await supabaseClient.from('users').select().eq('id', user.id).single();

    return UserModel.fromMap(userData);
  }
}
