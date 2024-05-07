// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAGAasrIb_yMLP8LWwlVpC_QpKvAedWj1E',
    appId: '1:561646255345:web:1f1e2d5a9cf5b77f977d50',
    messagingSenderId: '561646255345',
    projectId: 'branchtask',
    authDomain: 'branchtask.firebaseapp.com',
    storageBucket: 'branchtask.appspot.com',
    measurementId: 'G-68STH1SR94',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7oSOzUecKyVjPG5c40gPlBG28bSA4tOo',
    appId: '1:561646255345:android:9de48c1afebe22bb977d50',
    messagingSenderId: '561646255345',
    projectId: 'branchtask',
    storageBucket: 'branchtask.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1TnoWfgcVPPCBqIOXXtgfnlTm5XTTD3o',
    appId: '1:561646255345:ios:1f35a47633a0325d977d50',
    messagingSenderId: '561646255345',
    projectId: 'branchtask',
    storageBucket: 'branchtask.appspot.com',
    iosBundleId: 'com.example.crudOperation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1TnoWfgcVPPCBqIOXXtgfnlTm5XTTD3o',
    appId: '1:561646255345:ios:1f35a47633a0325d977d50',
    messagingSenderId: '561646255345',
    projectId: 'branchtask',
    storageBucket: 'branchtask.appspot.com',
    iosBundleId: 'com.example.crudOperation',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAGAasrIb_yMLP8LWwlVpC_QpKvAedWj1E',
    appId: '1:561646255345:web:43d5ffb5ac40b19c977d50',
    messagingSenderId: '561646255345',
    projectId: 'branchtask',
    authDomain: 'branchtask.firebaseapp.com',
    storageBucket: 'branchtask.appspot.com',
    measurementId: 'G-YZN6KLGH7Z',
  );
}
