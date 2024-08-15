import 'package:fitness_app/Route/Routes.dart';
import 'package:flutter/material.dart';

import 'Screens/Intro/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: RoutesGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}

