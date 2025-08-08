import 'package:nabd/core/services/auth_service.dart';
import 'package:nabd/core/services/crud_service.dart';
import 'package:nabd/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> signUpWithEmail(String email, String password);
  Future<AuthResponse> signInWithEmail(String email, String password);
  Future<void> signOut();
  Future<UserModel> ? getCurrentUser();
  Stream<AuthState> getAuthState();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthService _authService;
  final SupabaseCrudService _crudService;
  AuthRemoteDataSourceImpl(this._authService, this._crudService);

  @override
  Future<AuthResponse> signUpWithEmail(String email, String password) {
    return _authService.signUpWithEmail(email, password);
  }

  @override
  Future<AuthResponse> signInWithEmail(String email, String password) {
    return _authService.signInWithEmail(email, password);
  }

  @override
  Future<void> signOut() {
    return _authService.signOut();
  }

  @override

  Future<UserModel>  getCurrentUser() async{
    final user = await _crudService.getById(
      table: 'users',
      column: 'id',
      id: _authService.currentUser?.id,
    );
    if (user == null) {
      throw Exception('User not found');
    }
    UserModel userModel =   UserModel.fromJson(user);
    return userModel;
  }

  @override
  Stream<AuthState> getAuthState() {
    return _authService.authState;
  }
}
