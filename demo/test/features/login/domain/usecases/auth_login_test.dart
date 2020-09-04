
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:demo/features/login/domain/repositories/login_repository.dart';
import 'package:demo/features/login/domain/usecases/auth_login.dart';

class LoginRepositoryMock extends Mock implements ALoginRepository{}

void main(){
  ALoginRepository loginRepository;
  AuthLogin authLogin;

  setUp((){
    loginRepository = LoginRepositoryMock();
    authLogin = AuthLogin(loginRepository: loginRepository);
  });

  test("", (){
    //arrange
    //act
    //assert
  });
}