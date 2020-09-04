import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginBase with _$LoginStore;

abstract class _LoginBase with Store{
  @observable
  String login;
  
  @observable
  String password;
  
  @action
  void autenticate(){
    print('$login e $password');
  }
}