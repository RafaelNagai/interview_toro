import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:demo/core/errors/Failure.dart';
import 'package:demo/core/useCases/usecase.dart';
import 'package:demo/features/login/domain/entities/autenticate.dart';
import 'package:demo/features/login/domain/entities/login.dart';
import 'package:demo/features/login/domain/repositories/login_repository.dart';

class AuthLogin extends UseCase<AutenticateEntity, LoginEntity>{
  final ALoginRepository loginRepository;

  AuthLogin({@required this.loginRepository});

  @override
  Future<Either<Failure, AutenticateEntity>> call(LoginEntity params) async {
    return await loginRepository.login(params.login, params.password);
  }
}