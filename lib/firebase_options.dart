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
    apiKey: 'AIzaSyCC-P0z9dJQzRbH10UtUzwmEJvSSYyFHtU',
    appId: '1:237947824890:web:9088c68870fd2213ff7743',
    messagingSenderId: '237947824890',
    projectId: 'chat-app-7e693',
    authDomain: 'chat-app-7e693.firebaseapp.com',
    databaseURL: 'https://chat-app-7e693-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-7e693.appspot.com',
    measurementId: 'G-XSLQQEHMRG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8y6Oi-sFuWex61R0cjzFz-acjnfDtvhE',
    appId: '1:237947824890:android:8f4dada53de86001ff7743',
    messagingSenderId: '237947824890',
    projectId: 'chat-app-7e693',
    databaseURL: 'https://chat-app-7e693-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-7e693.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDK9zQCttq8r987hGYDdglJdBDh1d5TZqY',
    appId: '1:237947824890:ios:fca93fcca768e62eff7743',
    messagingSenderId: '237947824890',
    projectId: 'chat-app-7e693',
    databaseURL: 'https://chat-app-7e693-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-7e693.appspot.com',
    iosClientId: '237947824890-2b0fshv7rqni27a89nilmurckfe8mqvb.apps.googleusercontent.com',
    iosBundleId: 'com.example.chattingapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDK9zQCttq8r987hGYDdglJdBDh1d5TZqY',
    appId: '1:237947824890:ios:785e9bbdddb89337ff7743',
    messagingSenderId: '237947824890',
    projectId: 'chat-app-7e693',
    databaseURL: 'https://chat-app-7e693-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-7e693.appspot.com',
    iosClientId: '237947824890-gosbrqgvorq79qpgsoqb3njjpgsd732m.apps.googleusercontent.com',
    iosBundleId: 'com.example.chattingapp.RunnerTests',
  );
}
