import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/services/shared_prefrences_service.dart';
 import 'package:nabd/features/auth/data/repositories/auth_repository.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates( ) async {
    emit(const LoginState.loading());
    final response = await _authRepository.signInWithEmail(
      email: emailController.text,
      password: passwordController.text,
     );
    response.when(
      success: (user) {
        saveUserToken(user.session?.accessToken ?? '');
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
}
