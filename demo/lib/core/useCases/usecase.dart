import 'package:dartz/dartz.dart';
import 'package:demo/core/errors/Failure.dart';

abstract class UseCase<Type, Dynamic>{
  Future<Either<Failure, Type>> call(Dynamic params);
}