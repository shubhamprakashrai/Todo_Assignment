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
    apiKey: 'AIzaSyDEr-QsnnLWE7vm4jXaQsXb8KYk0ZYHh8c',
    appId: '1:924817519352:web:f2b8e8cf68b3ba5018410d',
    messagingSenderId: '924817519352',
    projectId: 'fir-notification-12b85',
    authDomain: 'fir-notification-12b85.firebaseapp.com',
    storageBucket: 'fir-notification-12b85.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3amZ2bJApPiT62PtRI_7N0CdvDaB69Io',
    appId: '1:924817519352:android:ecc3e97885b5e30c18410d',
    messagingSenderId: '924817519352',
    projectId: 'fir-notification-12b85',
    storageBucket: 'fir-notification-12b85.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAW_6tqUkEG24MeQqMiadGUp8F92VJhP5w',
    appId: '1:924817519352:ios:f686fbc7c97e24e718410d',
    messagingSenderId: '924817519352',
    projectId: 'fir-notification-12b85',
    storageBucket: 'fir-notification-12b85.firebasestorage.app',
    iosBundleId: 'com.todo.todoAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAW_6tqUkEG24MeQqMiadGUp8F92VJhP5w',
    appId: '1:924817519352:ios:f686fbc7c97e24e718410d',
    messagingSenderId: '924817519352',
    projectId: 'fir-notification-12b85',
    storageBucket: 'fir-notification-12b85.firebasestorage.app',
    iosBundleId: 'com.todo.todoAssignment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDEr-QsnnLWE7vm4jXaQsXb8KYk0ZYHh8c',
    appId: '1:924817519352:web:1ce599d1892e161c18410d',
    messagingSenderId: '924817519352',
    projectId: 'fir-notification-12b85',
    authDomain: 'fir-notification-12b85.firebaseapp.com',
    storageBucket: 'fir-notification-12b85.firebasestorage.app',
  );
}
