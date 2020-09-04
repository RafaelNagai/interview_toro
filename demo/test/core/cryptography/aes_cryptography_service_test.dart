import 'package:flutter_test/flutter_test.dart';
import 'package:demo/core/cryptography/aes_criptography_service.dart';
import 'package:demo/core/cryptography/cryptography_service.dart';

void main(){
  final String tText = 'teste';
  final tObject = {'name': 'Rafael', 'age': 27};
  final tTextEncrypted = 'diIY1NiaC8QeinGjMS8P2w==';
  final tObjectEncrypted = '1ApapL0E0psPVE2Z54zNfzEicsfTIbdz5wI1ih1MMNw=';

  ACryptographyService criptographyService;

  setUp((){
    criptographyService = AESCriptographyService();
  });

  group('Encrypt', (){
    test('should encript the object when the object is a String', (){
      //arrange
      //act
      criptographyService = AESCriptographyService();
      var encrypted = criptographyService.encrypt(tText);
      //assert
      expect(encrypted, tTextEncrypted);
    });

    test('should encript the object when the object is a dynamic', (){
      //arrange
      //act
      criptographyService = AESCriptographyService();
      var encrypted = criptographyService.encrypt(tObject);
      //assert
      expect(encrypted, tObjectEncrypted);
    });
  });

  group('Decrypt', (){
    test('should decrypt the hash and convert to string', (){
      //arrange
      //act
      criptographyService = AESCriptographyService();
      var decrypted = criptographyService.decrypt<String>(tTextEncrypted);
      //assert
      expect(decrypted, tText);
    });

    test('should decrypt the hash and convert to object', (){
      //arrange
      //act
      criptographyService = AESCriptographyService();
      var decrypted = criptographyService.decrypt<Map<String, dynamic>>(tObjectEncrypted);
      //assert
      expect(decrypted, tObject);
    });
  });
}