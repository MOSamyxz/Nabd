import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/services/crud_service.dart';
import 'package:nabd/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:nabd/features/auth/data/models/user_model.dart';
import 'package:nabd/features/auth/data/repositories/auth_repository.dart';

import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;
  final SupabaseCrudService _supabaseCrudService;
  final UserLocalStorage _localStorage;

  SignUpCubit(
    this._authRepository,
    this._supabaseCrudService,
    this._localStorage,
  ) : super(SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpState() async {
    emit(SignUpState.loading());
    final response = await _authRepository.signUpWithEmail(
      email: 'moosamyz9@gmail.com',
      password: 'password123',
    );

    response.when(
      success: (data) {
        UserModel userModel = UserModel(
          id: data.user!.id,
          userName: 'MOo',
          fullName: 'Mohamed Samy',
          email: 'moosamyz9@gmail.com',
          isPrivate: false,
          isVerified: false,
          points: 0,
          createdAt: DateTime.now(),
        );
        saveUserLocally(userModel);
        saveUserRemote(userModel);
        emit(SignUpState.success(data));
      },
      error: (error) {
        emit(SignUpState.error(error: error));
      },
    );
  }

  Future<void> saveUserLocally(UserModel userModel) async {
    await _localStorage.saveUser(userModel);
  }

  Future<void> saveUserRemote(UserModel userModel) async {
    await _supabaseCrudService.insert(table: 'users', data: userModel.toJson());
  }
}
