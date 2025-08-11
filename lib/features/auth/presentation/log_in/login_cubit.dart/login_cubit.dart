import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/cubits/cubit/user_cubit.dart';
import 'package:nabd/core/services/crud_service.dart';
import 'package:nabd/core/services/shared_prefrences_service.dart';
import 'package:nabd/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:nabd/features/auth/data/models/user_model.dart';
import 'package:nabd/features/auth/data/repositories/auth_repository.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final SupabaseCrudService _supabaseCrudService;
  final UserLocalStorage _localStorage;

  final UserCubit _userCubit;

  LoginCubit(
    this._authRepository,
    this._supabaseCrudService,
    this._userCubit,
    this._localStorage,
  ) : super(LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _authRepository.signInWithEmail(
      email: emailController.text,
      password: passwordController.text,
    );
    response.when(
      success: (user) {
        saveUserToken(user.session?.accessToken ?? '');
        getUser(user.user!.id).then((userModel) {
          saveUserLocally(userModel);
          _userCubit.setUser(userModel);
        });
        emit(LoginState.success(user));
      },
      error: (error) {
        emit(LoginState.error(error: error));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefrencesService.setSecuredString('userToken', token);
  }

  Future<void> saveUserLocally(UserModel userModel) async {
    await _localStorage.saveUser(userModel);
  }

  Future<UserModel> getUser(String userId) async {
    final userJson = await _supabaseCrudService.getById(
      table: 'users',
      column: 'id',
      id: userId,
    );
    if (userJson != null) {
      return UserModel.fromJson(userJson);
    } else {
      throw Exception('User not found');
    }
  }
}
