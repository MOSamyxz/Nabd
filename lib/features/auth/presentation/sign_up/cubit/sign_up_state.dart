import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  // Represents the initial state of the sign-up process
  const factory SignUpState.initial() = _Initial;

  // Represents a loading state during the sign-up process
  const factory SignUpState.loading() = Loading;

  // Represents a successful sign-up with user data
  const factory SignUpState.success(T data) = Success<T>;

  // Represents an error state with an error message
  const factory SignUpState.error({required String error}) = Error;
}
