import 'package:nabd/core/services/supabase_result.dart';
import 'package:nabd/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:nabd/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nabd/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final UserLocalStorage _localStorage;

  AuthRepository({
    required AuthRemoteDataSource remoteDataSource,
    required UserLocalStorage localStorage,
  }) : _remoteDataSource = remoteDataSource,
       _localStorage = localStorage;

  // تسجيل مستخدم جديد
  Future<SupabaseResult<AuthResponse>> signUpWithEmail(
    String email,
    String password,
    UserModel userModel,
  ) async {
    try {
      final response = await _remoteDataSource.signUpWithEmail(email, password);
      if (response.user == null) {
        return SupabaseResult.error('Sign up failed');
      }
      await _localStorage.saveUser(userModel);
      return SupabaseResult.success(response);
    } catch (e) {
      return SupabaseResult.error(e.toString());
    }
  }
 
  // تسجيل دخول وحفظ المستخدم محليًا
  Future<SupabaseResult<AuthResponse>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.signInWithEmail(email, password);
      if (response.user == null) {
        return SupabaseResult.error('Login failed');
      }
      UserModel? userModel = await _remoteDataSource.getCurrentUser();
      if (userModel != null) {
        await _localStorage.saveUser(userModel);
      }
        return SupabaseResult.success(response);
    } catch (e) {
      return SupabaseResult.error(e.toString());
    }
  }

  // تسجيل الخروج وحذف المستخدم من التخزين المحلي
  Future<void> signOut() async {
    await _remoteDataSource.signOut();
    await _localStorage.clearUser();
  }

  // جلب المستخدم من التخزين المحلي
  Future<UserModel?> getLocalUser() async {
    return _localStorage.getUser();
  }

  // التحقق من وجود مستخدم محلي
  Future<bool> hasLocalUser() async {
    return _localStorage.getUser() != null;
  }

  // الاستماع لتغير حالة المستخدم من Supabase
  Stream<AuthState> get authStateChanges => _remoteDataSource.getAuthState();
}
