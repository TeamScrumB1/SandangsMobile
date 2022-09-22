import 'package:flutter/material.dart';
import 'package:sandangs/pages/login.dart';
import 'package:sandangs/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      initialRoute: splashRoute,
      routes: routes,
      home: const LoginScreen(),
    );
  }
}

