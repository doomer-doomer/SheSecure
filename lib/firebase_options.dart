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
    apiKey: 'AIzaSyBZR6MCp22cMw3ff0Wvi_U1wLXv5P1azIM',
    appId: '1:739170751544:web:2e41e6dad3f03bd0b982cd',
    messagingSenderId: '739170751544',
    projectId: 'she-911f8',
    authDomain: 'she-911f8.firebaseapp.com',
    storageBucket: 'she-911f8.appspot.com',
    measurementId: 'G-EP9X1WKZST',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpMBa-U4uePEBX2UeaZueWUzEthZjqvG0',
    appId: '1:739170751544:android:5e389001cf495c62b982cd',
    messagingSenderId: '739170751544',
    projectId: 'she-911f8',
    storageBucket: 'she-911f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLjInhj-PW58NqhXL2HDGjYLtBvedOgEE',
    appId: '1:739170751544:ios:c1abc0a92278166fb982cd',
    messagingSenderId: '739170751544',
    projectId: 'she-911f8',
    storageBucket: 'she-911f8.appspot.com',
    iosBundleId: 'com.example.shesecure',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLjInhj-PW58NqhXL2HDGjYLtBvedOgEE',
    appId: '1:739170751544:ios:ad2f06a8f8bf73aab982cd',
    messagingSenderId: '739170751544',
    projectId: 'she-911f8',
    storageBucket: 'she-911f8.appspot.com',
    iosBundleId: 'com.example.shesecure.RunnerTests',
  );
}
