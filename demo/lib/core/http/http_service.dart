import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:demo/core/cryptography/cryptography_service.dart';
import 'package:demo/core/errors/Exceptions.dart';

abstract class AHttpService {
  Future<Map<String,dynamic>> post(String actionUrl, Map<String, dynamic> body);
  Future<Map<String,dynamic>> get(String actionUrl);
}

class HttpService implements AHttpService {
  final ACryptographyService cryptographyService;
  final String _baseUrlEncrypted = '';
  final String _ocpApimSubscriptionKeyEncrypted = '';
  final http.Client client;

  Map<String,String> get _baseHeader {
    Map<String, String> headers = Map<String, String>();
    headers['Ocp-Apim-Subscription-Key'] = cryptographyService.decrypt(_ocpApimSubscriptionKeyEncrypted);
    headers['Content-Type'] = 'application/json; charset=UTF-8';
    return headers;
  }

  String get _baseUrl => cryptographyService.decrypt<String>(_baseUrlEncrypted);

  HttpService({@required this.client, @required this.cryptographyService});
  
  @override
  Future<Map<String,dynamic>> post(String actionUrl, Map<String, dynamic> body) async {
    var response = await client.post('$_baseUrl/$actionUrl', headers: _baseHeader, body: jsonEncode(body));
    _validate(response.statusCode);
    return jsonDecode(response.body);
  }

  @override
  Future<Map<String,dynamic>> get(String actionUrl) async {
    var response = await client.get('$_baseUrl/$actionUrl', headers: _baseHeader);
    _validate(response.statusCode);
    return jsonDecode(response.body);
  }

  Future<void> _validate(int responseCode){
    if(responseCode >= 200 && responseCode < 299) 
      return null;
    else
      throw ServerException();
  }
}