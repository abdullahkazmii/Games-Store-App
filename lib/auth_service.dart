import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User, UserCredential;
import 'package:flutter/foundation.dart';

class FirebaseServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?>signUpMethod(String email, String password) async{
    try{
      UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
              email: email,
              password: password);
      return credential.user;
    }
    catch(e){
      if(kDebugMode){
        print("failed to signup");
      }
    }
    return null;
  }

  Future<User?>signInMethod(String email, String password) async{
    try{
      UserCredential credential =
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      return credential.user;
    }
    catch(e){
      if(kDebugMode){
        print("failed to signIn");
      }
    }
    return null;
  }
}