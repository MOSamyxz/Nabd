import 'package:dartz/dartz.dart';
import 'package:nabd/core/errors/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
