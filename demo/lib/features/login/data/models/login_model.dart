import 'package:demo/features/login/domain/entities/login.dart';
import 'package:meta/meta.dart';

class LoginModel extends LoginEntity{
  LoginModel({
    @required String login,
    @required String password
  });

  Map<String, dynamic> toMap(){
    return {
      "login": this.login,
      "password": this.password
    };
  }
}