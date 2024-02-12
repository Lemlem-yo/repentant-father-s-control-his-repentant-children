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
    apiKey: 'AIzaSyCMZI8E61BMQJCmWL3rWHbyTvgKfnmdm-s',
    appId: '1:1087806693694:web:3ddc6edfc451f645ce8c6f',
    messagingSenderId: '1087806693694',
    projectId: 'confession-managment-system',
    authDomain: 'confession-managment-system.firebaseapp.com',
    storageBucket: 'confession-managment-system.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwl0m9ckqhlI_ycjL771IHDnAI8dsaW6E',
    appId: '1:1087806693694:android:c5dfc25d18edf134ce8c6f',
    messagingSenderId: '1087806693694',
    projectId: 'confession-managment-system',
    storageBucket: 'confession-managment-system.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAI1T-D-9tmcz0DKaaKk5Di9pf1VgKDDOc',
    appId: '1:1087806693694:ios:52a050986e568de8ce8c6f',
    messagingSenderId: '1087806693694',
    projectId: 'confession-managment-system',
    storageBucket: 'confession-managment-system.appspot.com',
    iosBundleId: 'com.example.niu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAI1T-D-9tmcz0DKaaKk5Di9pf1VgKDDOc',
    appId: '1:1087806693694:ios:52a050986e568de8ce8c6f',
    messagingSenderId: '1087806693694',
    projectId: 'confession-managment-system',
    storageBucket: 'confession-managment-system.appspot.com',
    iosBundleId: 'com.example.niu',
  );
}
