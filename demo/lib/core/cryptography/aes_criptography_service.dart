import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:demo/core/cryptography/cryptography_service.dart';

class AESCriptographyService extends ACryptographyService{
  //A7=erP@,n2e0fm34/5f4FE#6Anfi82ql
  final key = Key.fromBase64("QTc9ZXJQQCxuMmUwZm0zNC81ZjRGRSM2QW5maTgycWw=");
  //hfj972H&f23K41x=
  final iv = IV.fromBase64("aGZqOTcySCZmMjNLNDF4PQ==");
  Encrypter encrypter;

  AESCriptographyService(){
    encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  }

  @override
  T decrypt<T>(String encrypted) {
    var decrypted = encrypter.decrypt64(encrypted, iv: iv);
    if(T == String)
      return decrypted as T;
    else 
      return jsonDecode(decrypted) as T;
  }
  
  @override
  String encrypt(object) {
    if(object is String)
      return encrypter.encrypt(object, iv: iv).base64;
    else if(object is Map<String,dynamic>)
      return encrypter.encrypt(jsonEncode(object), iv: iv).base64;
    else
      throw Exception();
  }
}