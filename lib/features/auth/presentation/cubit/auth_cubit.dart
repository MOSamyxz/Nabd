import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/register_user.dart';
import '../../domain/usecases/login_user.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUser registerUser;
  final LoginUser loginUser;

  AuthCubit({required this.registerUser, required this.loginUser})
    : super(AuthInitial());

  TextEditingController signUpUserNameController = TextEditingController();
  TextEditingController signUpFullNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  Future<void> signUp( ) async {
    emit(SignUpLoading());
    final result = await registerUser(
      email: signUpEmailController.text,
      password: signUpPasswordController.text,
      username: signUpUserNameController.text,
      fullName: signUpFullNameController.text,  
    );
    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (user) => emit(SignUpSuccess(user)),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginUser(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  void logout() {
    emit(AuthInitial());
  }
}
