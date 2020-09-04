import 'package:dartz/dartz.dart';
import 'package:demo/core/errors/Failure.dart';
import 'package:demo/features/login/domain/entities/autenticate.dart';

abstract class ALoginRepository{
  Future<Either<Failure, AutenticateEntity>> login(String login, String password);
}