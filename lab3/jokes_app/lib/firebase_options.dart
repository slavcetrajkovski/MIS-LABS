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
    apiKey: 'AIzaSyDho0p1d4mc_X88I8JxEOk7JuysNaaKc2I',
    appId: '1:688677517319:web:78a7e8851df5437e2e12a2',
    messagingSenderId: '688677517319',
    projectId: 'lab2-6ecac',
    authDomain: 'lab2-6ecac.firebaseapp.com',
    storageBucket: 'lab2-6ecac.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAl1oNLS-vbOWSm-d-DNhuxG3uOg5gN7sg',
    appId: '1:688677517319:android:9a752fc7c73604042e12a2',
    messagingSenderId: '688677517319',
    projectId: 'lab2-6ecac',
    storageBucket: 'lab2-6ecac.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJiwrOghwLE2sl8K_GAhjzRbhAsrwNw1I',
    appId: '1:688677517319:ios:0b13c5bd80d3f5412e12a2',
    messagingSenderId: '688677517319',
    projectId: 'lab2-6ecac',
    storageBucket: 'lab2-6ecac.firebasestorage.app',
    iosBundleId: 'com.example.jokesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJiwrOghwLE2sl8K_GAhjzRbhAsrwNw1I',
    appId: '1:688677517319:ios:0b13c5bd80d3f5412e12a2',
    messagingSenderId: '688677517319',
    projectId: 'lab2-6ecac',
    storageBucket: 'lab2-6ecac.firebasestorage.app',
    iosBundleId: 'com.example.jokesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDho0p1d4mc_X88I8JxEOk7JuysNaaKc2I',
    appId: '1:688677517319:web:b230a145509a7d7f2e12a2',
    messagingSenderId: '688677517319',
    projectId: 'lab2-6ecac',
    authDomain: 'lab2-6ecac.firebaseapp.com',
    storageBucket: 'lab2-6ecac.firebasestorage.app',
  );
}
