import 'package:flutter/material.dart';
import 'package:sandangs/constant.dart';
import 'package:sandangs/pages/login.dart';
import 'package:sandangs/widget/authentication/auth_service.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Image.asset(
          'lib/assets/images/textlogo.png',
          width: 130,
          height: 130,
        ),
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: IconButton(
              icon  : Icon(
                Icons.logout,
                size: 25,
                color: secondaryColor,
              ),
              onPressed: (){
                AuthService.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen())
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
