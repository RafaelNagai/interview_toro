import 'package:demo/core/http/http_service.dart';
import 'package:meta/meta.dart';
import 'package:demo/features/login/data/models/autenticate_model.dart';
import 'package:demo/features/login/data/models/login_model.dart';

abstract class AAutenticateRemoteDataSource {
  Future<AutenticateModel> login(String login, String password);
}

class AutenticateRemoteDataSource extends AAutenticateRemoteDataSource{

  final String url = "";
  final AHttpService httpService;

  AutenticateRemoteDataSource({
    @required this.httpService
  });

  @override
  Future<AutenticateModel> login(String login, String password) async {
    var response = await httpService.post(url, LoginModel(login: login, password: password).toMap());
    return AutenticateModel.create(response);
  }

}