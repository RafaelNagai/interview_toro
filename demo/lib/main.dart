import 'package:flutter/material.dart';
import 'package:demo/core/dependecyInjection/dependecy_injection.dart';
import 'package:demo/core/dependecyInjection/get_it_dependency.dart';
import 'package:demo/features/login/presentation/pages/login_page.dart';

void main() {
  //ADependencyInjection dependecyInjection = GetItDependency();
  //dependecyInjection.init();

  runApp(LoginPage());
}