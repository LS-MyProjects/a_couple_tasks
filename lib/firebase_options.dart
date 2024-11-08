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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAFF8sHCYOAj0do7SjFSlg9zjsl-GTRGDo',
    appId: '1:24294145071:web:cf4d1a4c5754bf43f95ada',
    messagingSenderId: '24294145071',
    projectId: 'a-couple-tasks-6db51',
    authDomain: 'a-couple-tasks-6db51.firebaseapp.com',
    storageBucket: 'a-couple-tasks-6db51.firebasestorage.app',
    measurementId: 'G-1YR5Z5ZX1Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFQtu_Xn1tPZ3__5S9o6zLNWMrDmCnwEk',
    appId: '1:24294145071:android:f5314726c6fc884bf95ada',
    messagingSenderId: '24294145071',
    projectId: 'a-couple-tasks-6db51',
    storageBucket: 'a-couple-tasks-6db51.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwvntOs_F2-IPR_s24yDM5DR5AZpTHp8I',
    appId: '1:24294145071:ios:4f6af2c11fca3c8ef95ada',
    messagingSenderId: '24294145071',
    projectId: 'a-couple-tasks-6db51',
    storageBucket: 'a-couple-tasks-6db51.firebasestorage.app',
    iosBundleId: 'com.lsdev.aCoupleTasks',
  );

}