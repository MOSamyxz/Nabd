import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String email,
    required String password,
    required String username,
    required String fullName, 
  }) async {
    try {
      final user = await datasource.signUpUser(
        email: email,
        password: password,
        username: username,
        fullName: fullName, 
        bio: '',
        birthDate: null,
        socialLinks: null,
      );
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await datasource.loginUser(
        email: email,
        password: password,
      );
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> logout() => datasource.logout();

  @override
  Future<UserEntity?> getCurrentUser() => datasource.getCurrentUser();
}
