import 'package:demo/core/errors/Failure.dart';
import 'package:demo/features/login/data/datasources/autenticate_remote_datasource.dart';
import 'package:demo/features/login/domain/entities/autenticate.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:demo/features/login/domain/repositories/login_repository.dart';

class LoginRepository extends ALoginRepository{

  final AAutenticateRemoteDataSource autenticateRemoteDataSource;

  LoginRepository({
    @required this.autenticateRemoteDataSource
  });

  @override
  Future<Either<Failure, AutenticateEntity>> login(String login, String password) async {
    try{
      return Right(await autenticateRemoteDataSource.login(login, password));
    }
    catch(Exception){
      return Left(ServerFailure());
    }
  }
}