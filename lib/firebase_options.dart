// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDn0Uk3AjsF1A8884xVB7gpimx14FDLum8',
    appId: '1:783667866828:web:c581a6ec64d56cd548a669',
    messagingSenderId: '783667866828',
    projectId: 'game-store-app-f429b',
    authDomain: 'game-store-app-f429b.firebaseapp.com',
    storageBucket: 'game-store-app-f429b.appspot.com',
    measurementId: 'G-NK0MFQKY4N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWhlfB1q4C0ANocPQw-PNwRhlxlg0eYgM',
    appId: '1:783667866828:android:06809169c7fe9fe148a669',
    messagingSenderId: '783667866828',
    projectId: 'game-store-app-f429b',
    storageBucket: 'game-store-app-f429b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBldSoCbv3KeWHulxNBIAvVGosv6pSAtqA',
    appId: '1:783667866828:ios:f5e4cffa432ecb4e48a669',
    messagingSenderId: '783667866828',
    projectId: 'game-store-app-f429b',
    storageBucket: 'game-store-app-f429b.appspot.com',
    androidClientId: '783667866828-dnrinmg56d0paj6efu2boqavth2kvahb.apps.googleusercontent.com',
    iosClientId: '783667866828-m8oh4id90bnqpd45brggod85reg3i7d2.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectMob',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBldSoCbv3KeWHulxNBIAvVGosv6pSAtqA',
    appId: '1:783667866828:ios:15f73e6868eb6a7548a669',
    messagingSenderId: '783667866828',
    projectId: 'game-store-app-f429b',
    storageBucket: 'game-store-app-f429b.appspot.com',
    androidClientId: '783667866828-dnrinmg56d0paj6efu2boqavth2kvahb.apps.googleusercontent.com',
    iosClientId: '783667866828-3clueb8rrjvbcj6r387t6jst2lu2hre1.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectMob.RunnerTests',
  );
}
