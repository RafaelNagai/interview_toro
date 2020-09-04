import 'package:demo/features/login/domain/entities/autenticate.dart';
import 'package:meta/meta.dart';

class AutenticateModel extends AutenticateEntity{
  AutenticateModel({
    @required String token,
    @required String subscriptionKey
  });

  factory AutenticateModel.create(Map<String, dynamic> params){
    return AutenticateModel(
      token: params['token'],
      subscriptionKey: params['subscriptionKey']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "token": this.token,
      "subscriptionKey": this.subscriptionKey
    };
  }
}