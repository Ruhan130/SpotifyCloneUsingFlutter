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
    apiKey: 'AIzaSyDCT6r9RcRASZNS8ZsVrKY9iFnZSBZP3AI',
    appId: '1:776708184719:web:3bcecb0ce41dec25522efa',
    messagingSenderId: '776708184719',
    projectId: 'spotify-project-09',
    authDomain: 'spotify-project-09.firebaseapp.com',
    storageBucket: 'spotify-project-09.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXn_tZoYloyjzvkKA8Es5CasOQpIm10OA',
    appId: '1:776708184719:android:4561b75d8bff31a7522efa',
    messagingSenderId: '776708184719',
    projectId: 'spotify-project-09',
    storageBucket: 'spotify-project-09.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAO25zXA8l9PYcWVuZKm4mh1WPGU7NY7ao',
    appId: '1:776708184719:ios:8f8015b8d70511c9522efa',
    messagingSenderId: '776708184719',
    projectId: 'spotify-project-09',
    storageBucket: 'spotify-project-09.firebasestorage.app',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAO25zXA8l9PYcWVuZKm4mh1WPGU7NY7ao',
    appId: '1:776708184719:ios:8f8015b8d70511c9522efa',
    messagingSenderId: '776708184719',
    projectId: 'spotify-project-09',
    storageBucket: 'spotify-project-09.firebasestorage.app',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDCT6r9RcRASZNS8ZsVrKY9iFnZSBZP3AI',
    appId: '1:776708184719:web:a1ae7f8e239cb34c522efa',
    messagingSenderId: '776708184719',
    projectId: 'spotify-project-09',
    authDomain: 'spotify-project-09.firebaseapp.com',
    storageBucket: 'spotify-project-09.firebasestorage.app',
  );
}