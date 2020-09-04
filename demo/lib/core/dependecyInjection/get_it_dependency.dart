import 'package:get_it/get_it.dart';
import 'package:demo/core/cryptography/aes_criptography_service.dart';
import 'package:demo/core/cryptography/cryptography_service.dart';
import 'package:demo/core/database/database.dart';
import 'package:demo/core/database/sqflite_database.dart';
import 'package:demo/core/http/http_service.dart';
import 'package:http/http.dart' as http;
import 'dependecy_injection.dart';

class GetItDependency extends ADependencyInjection{
  
  @override
  init() async {
    ADependencyInjection.instance = this;
    final instance = GetIt.instance;


    //! Core
    instance.registerLazySingleton<ACryptographyService>(() => AESCriptographyService());
    instance.registerLazySingleton<http.Client>(() => http.Client());
    instance.registerLazySingleton<AHttpService>(() => HttpService(client: get(), cryptographyService: get()));
    //instance.registerLazySingleton<ADataBase>(() => SqfliteDataBase());
  }

  @override
  T get<T>() {
    return GetIt.instance.get<T>();
  }
}