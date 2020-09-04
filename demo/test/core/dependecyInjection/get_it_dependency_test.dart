import 'package:flutter_test/flutter_test.dart';
import 'package:demo/core/dependecyInjection/dependecy_injection.dart';
import 'package:demo/core/dependecyInjection/get_it_dependency.dart';
import 'package:demo/core/http/http_service.dart';

void main(){
  ADependencyInjection dependencyInjection;

  setUp((){
    dependencyInjection = GetItDependency();
    dependencyInjection.init();
  });

  test('should return the HttpService when the get_it was initiated', (){
    //arrange
    //act
    AHttpService httpServiceAbs = dependencyInjection.get<AHttpService>();
    //assert
    expect(httpServiceAbs, isNotNull);
  });
}