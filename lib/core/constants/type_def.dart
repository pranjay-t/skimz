import 'package:fpdart/fpdart.dart';
import 'package:skimz/core/constants/failure.dart';

typedef FutureEither<T> = Future<Either<Failure,T>>;
typedef FutureVoid = FutureEither<void>;