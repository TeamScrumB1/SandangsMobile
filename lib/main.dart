import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandangs/pages/login.dart';
import 'package:sandangs/routes.dart';
import 'package:sandangs/widget/provider/fitting_room_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FittingRoomProv())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins'
        ),
        initialRoute: splashRoute,
        routes: routes,
        home: const LoginScreen(),
      ),
    );
  }
}

