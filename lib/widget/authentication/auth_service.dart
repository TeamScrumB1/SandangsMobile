import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<AuthResult> signIn({required String email,required String pass}) async {
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return AuthResult(user: result.user);
    } catch(e) {
      return AuthResult(message: e.toString());
    }
  }

  Future<AuthResult> createUser({required String email,required String pass}) async {
    try{
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return AuthResult(user: result.user);
    } catch(e) {
      return AuthResult(message: e.toString());
    }
  }

  static void signOut(){
    auth.signOut();
  }
}

class AuthResult{
  final User? user;
  String? message;

  AuthResult({this.user, this.message});
}