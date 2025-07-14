import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
    required String username,
    required String fullName,

  }) {
    return repository.signUp(
      email: email,
      password: password,
      username: username,
      fullName: fullName,

    );
  }
}
