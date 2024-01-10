import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/login.dart';
import 'package:project/signup.dart';
import 'package:project/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  // apiKey: "AIzaSyDn0Uk3AjsF1A8884xVB7gpimx14FDLum8",
  // authDomain: "game-store-app-f429b.firebaseapp.com",
  // projectId: "game-store-app-f429b",
  // storageBucket: "game-store-app-f429b.appspot.com",
  // messagingSenderId: "783667866828",
  // appId: "1:783667866828:web:c581a6ec64d56cd548a669"
  // ),);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: splash_screen.id, //pehla screen konsi show ho
    routes: { //routes apkai different pages kai leay hota hai
      splash_screen.id:(context)=>splash_screen(),
      login.id:(context)=>login(),
      signup.id:(context)=>signup(),//dusra wala class ka name hota hai
      homepage.id:(context)=>homepage(),
    },
  ));
}
