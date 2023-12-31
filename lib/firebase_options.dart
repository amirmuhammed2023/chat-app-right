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
    apiKey: 'AIzaSyCmh0AIcNYxXb92AogyDL_-yuLgwh3z3-Q',
    appId: '1:135460688864:web:91d2fabd6a20e7296e9185',
    messagingSenderId: '135460688864',
    projectId: 'chat-app-e9409',
    authDomain: 'chat-app-e9409.firebaseapp.com',
    storageBucket: 'chat-app-e9409.appspot.com',
    measurementId: 'G-79Q16N74N9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdj8XcS6QkSzZ0zv3TAue5vfeyY1nzRNE',
    appId: '1:135460688864:android:43af0b570c344b246e9185',
    messagingSenderId: '135460688864',
    projectId: 'chat-app-e9409',
    storageBucket: 'chat-app-e9409.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLtVSDVuiIQ6wryPAWZKC0CPdrss2za10',
    appId: '1:135460688864:ios:37a1d215385a81c66e9185',
    messagingSenderId: '135460688864',
    projectId: 'chat-app-e9409',
    storageBucket: 'chat-app-e9409.appspot.com',
    iosClientId: '135460688864-64bo33kp33cg2o6vlqlpgk7oen9ish6b.apps.googleusercontent.com',
    iosBundleId: 'com.example.onetwo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLtVSDVuiIQ6wryPAWZKC0CPdrss2za10',
    appId: '1:135460688864:ios:f53c39553fd9a3d96e9185',
    messagingSenderId: '135460688864',
    projectId: 'chat-app-e9409',
    storageBucket: 'chat-app-e9409.appspot.com',
    iosClientId: '135460688864-r3b93ddvl3fh5t4uhvagiuqa9vov7i8p.apps.googleusercontent.com',
    iosBundleId: 'com.example.onetwo.RunnerTests',
  );
}
