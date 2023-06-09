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
    apiKey: 'AIzaSyB3vilG136tvPka9HFtLLFCqiSx7Y5HgOg',
    appId: '1:680703257326:web:48a64a4c0351ec0df8e1ff',
    messagingSenderId: '680703257326',
    projectId: 'roboapp-2ac15',
    authDomain: 'roboapp-2ac15.firebaseapp.com',
    databaseURL: 'https://roboapp-2ac15-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'roboapp-2ac15.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgmr0auBTGdZ4gijUz_xNfEeKDaIDvkXo',
    appId: '1:680703257326:android:dfdb1950a4ae1d3df8e1ff',
    messagingSenderId: '680703257326',
    projectId: 'roboapp-2ac15',
    databaseURL: 'https://roboapp-2ac15-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'roboapp-2ac15.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZFAddeK2qjhjAX6vsWX7YlShCqbzkEic',
    appId: '1:680703257326:ios:1daf3b8d658f3fdbf8e1ff',
    messagingSenderId: '680703257326',
    projectId: 'roboapp-2ac15',
    databaseURL: 'https://roboapp-2ac15-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'roboapp-2ac15.appspot.com',
    iosClientId: '680703257326-92seuhnhn1qog8ao237ns860s64orkmt.apps.googleusercontent.com',
    iosBundleId: 'com.example.robo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZFAddeK2qjhjAX6vsWX7YlShCqbzkEic',
    appId: '1:680703257326:ios:1daf3b8d658f3fdbf8e1ff',
    messagingSenderId: '680703257326',
    projectId: 'roboapp-2ac15',
    databaseURL: 'https://roboapp-2ac15-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'roboapp-2ac15.appspot.com',
    iosClientId: '680703257326-92seuhnhn1qog8ao237ns860s64orkmt.apps.googleusercontent.com',
    iosBundleId: 'com.example.robo',
  );
}
