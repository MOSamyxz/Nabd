import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String password,
    required String username,
        required String fullName, 
  });

  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<UserEntity?> getCurrentUser();
}
