import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sandangs/constant.dart';
import 'package:sandangs/pages/sign_up.dart';
import 'package:sandangs/widget/authentication/auth_service.dart';
import 'package:sandangs/widget/bottom_menu/bottom_menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image(
              image: const AssetImage('lib/assets/images/bg-profile.jpg'),
              height: size.height*0.3,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.22),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.white,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      // key: globalFormKey,
                      children: [
                        TextFormField(
                          controller: _email,
                          cursorColor: secondaryColor,
                          style: TextStyle(color: secondaryColor),
                          showCursor: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: customFormInputEmail,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _pass,
                          cursorColor: secondaryColor,
                          style: TextStyle(color: secondaryColor),
                          showCursor: true,
                          keyboardType: TextInputType.text,
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: secondaryColor),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: secondaryColor, width: 2),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: secondaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: secondaryColor.withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: size.width-80,
                              height: 37,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [thirdColor,secondaryColor],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(5.0),
                                  primary: Colors.white,
                                  shadowColor: Colors.black,
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Poppins'),
                                ),
                                onPressed: () async {
                                  AuthResult result = await AuthService().signIn(email: _email.text, pass: _pass.text);
                                  if(result.user != null){
                                    Fluttertoast.showToast(
                                      msg: "Login Successfull",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.white,
                                      fontSize: 15,
                                      textColor: secondaryColor,
                                    );
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => const BottomMenu())
                                    );
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: "Username or Password Incorrect",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 3,
                                      backgroundColor: Colors.white,
                                      fontSize: 15,
                                      textColor: secondaryColor,
                                    );
                                  }
                                },
                                child: const Text('Login'),
                              ),
                            )
                          ], // <Widget>[]
                        ),

                        Container(
                          height: size.height*0.33,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an Account ?",
                              style: TextStyle(color: secondaryColor),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return const SignUp();
                                    })
                                );
                              },
                              child: Text(
                                " Sign Up",
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ], // <Widget>[]
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
