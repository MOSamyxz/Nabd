import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final UserEntity user;

  const SignUpSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class SignUpFailure extends AuthState {
  final String message;

  const SignUpFailure(this.message);

  @override
  List<Object?> get props => [message];
}
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final UserEntity user;

  const LoginSuccess(this.user);

  @override
  List<Object?> get props => [user];

}
class LoginFailure extends AuthState {
  final String message;

  const LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}
