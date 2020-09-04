import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:demo/features/login/presentation/stores/login_store.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            child: Form(
              autovalidate: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
                          alignLabelWithHint: true,
                          labelText: 'Login'
                        ),
                        onChanged: (value){
                          _loginStore.login = value;
                        },
                        validator: (value) {
                          return null;
                        },
                      );
                    },              
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Observer(
                      builder: (_) {
                        return TextFormField(
                          decoration: InputDecoration( 
                            contentPadding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
                            alignLabelWithHint: true,
                            labelText: 'Password'
                          ),
                          onChanged: (value){
                            _loginStore.password = value;
                          },
                          validator: (value) {
                            return null;
                          },
                        );
                      },
                    ),
                  ),
                  FlatButton(
                    child: Text('Logar'),
                    onPressed: () => _loginStore.autenticate(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}