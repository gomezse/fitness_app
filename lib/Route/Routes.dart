
import 'package:fitness_app/Screens/BottomBar/bottomBar.dart';
import 'package:fitness_app/Screens/Home/home.dart';
import 'package:fitness_app/Screens/Intro/intro.dart';
import 'package:fitness_app/Screens/Login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutesGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
          return MaterialPageRoute(builder: (_)=> IntroPage());

      case '/home':
        return MaterialPageRoute(builder: (_)=> BottombarPage());

      case '/login':
        return MaterialPageRoute(builder: (_)=> LoginPage());
    }

    return _errorRoute();

  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text('Error')
        )
      );
    });
  }



}