import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:demo/core/database/database.dart';
import 'package:demo/core/database/sqflite_database.dart';

class DatabaseMock extends Mock implements Database{}
class ModelTest {
  final String name;
  final int age;
  ModelTest({this.name, this.age});

  Map<String, dynamic> toMap(){
    return {
      "Name": this.name,
      "Age": this.age
    };
  }
}

void main(){
  DatabaseMock databaseMock;
  ADataBase<ModelTest> sqfliteDatabase;
  ModelTest modelTest;

  setUp((){
    databaseMock = DatabaseMock();
    sqfliteDatabase = SqfliteDataBase<ModelTest>(database: databaseMock);
    modelTest = ModelTest(name: "'Pub Dev'", age: 26);
  });

  group('Creation Tests', (){
    test('should create a new table ModelTest when it pass the correct parameters', () async{
      //arrange
      when(databaseMock.execute(any)).thenAnswer((realInvocation) => Future.value(null));
      final parameters = [
        'ID INTEGER Primary Key',
        'Name TEXT',
        'Age INTEGER'
      ];
      //act
      await sqfliteDatabase.create(parameters);
      //assert
      verify(databaseMock.execute(any));
      verifyNoMoreInteractions(databaseMock);
    });
  });

  group('Insert Tests', (){
    test('should insert a new ModelTest when it pass the correct parameters', () async{
      //arrange
      when(databaseMock.rawInsert(any)).thenAnswer((realInvocation) => Future.value(1));
      //act
      await sqfliteDatabase.save(modelTest.toMap());
      //assert
      verify(databaseMock.rawInsert(any));
      verifyNoMoreInteractions(databaseMock);
    });
  });

  group('Delete Tests', (){
    test('should delete a ModelTest when it pass the correct parameters', () async{
      //arrange
      when(databaseMock.rawDelete(any, any)).thenAnswer((realInvocation) => Future.value(1));
      //act
      await sqfliteDatabase.delete(modelTest.toMap());
      //assert
      verify(databaseMock.rawDelete(any, any));
      verifyNoMoreInteractions(databaseMock);
    });
  });

  group('Select Tests', (){
    test('should return a ModelTest when it pass the correct parameters to select', () async{
      //arrange
      when(databaseMock.rawQuery(any, any)).thenAnswer((realInvocation) => Future.value([modelTest.toMap()]));
      //act
      final items = await sqfliteDatabase.select(modelTest.toMap());
      //assert
      expect(items[0], modelTest.toMap());
      verify(databaseMock.rawQuery(any, any));
      verifyNoMoreInteractions(databaseMock);
    });
  });
}