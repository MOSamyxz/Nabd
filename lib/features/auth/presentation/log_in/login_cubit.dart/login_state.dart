
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
 // Represents the initial state of the login process
  const factory LoginState.initial() = _Initial;

  // Represents a loading state during the login process
  const factory LoginState.loading() = Loading;

  // Represents a successful login with user data
  const factory LoginState.success(T data) = Success<T>;

  // Represents an error state with an error message
  const factory LoginState.error({required String error}) = Error;

  }