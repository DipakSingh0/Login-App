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
    apiKey: 'AIzaSyCQBYuAPzrBE-tnqyzpPP20T4bnCmI_nxI',
    appId: '1:675954426803:web:398fbb76077f67430381c6',
    messagingSenderId: '675954426803',
    projectId: 'loginfirebase-1b71b',
    authDomain: 'loginfirebase-1b71b.firebaseapp.com',
    storageBucket: 'loginfirebase-1b71b.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdJu681xHLKEM-4xnZouLlTJleAWq5bwg',
    appId: '1:675954426803:android:515fdbdbc92bfc760381c6',
    messagingSenderId: '675954426803',
    projectId: 'loginfirebase-1b71b',
    storageBucket: 'loginfirebase-1b71b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDY4SKBOkWPq6_p1zm-W-c14DUgsCnz2Oo',
    appId: '1:675954426803:ios:ec5dbf52a0d02d670381c6',
    messagingSenderId: '675954426803',
    projectId: 'loginfirebase-1b71b',
    storageBucket: 'loginfirebase-1b71b.firebasestorage.app',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDY4SKBOkWPq6_p1zm-W-c14DUgsCnz2Oo',
    appId: '1:675954426803:ios:ec5dbf52a0d02d670381c6',
    messagingSenderId: '675954426803',
    projectId: 'loginfirebase-1b71b',
    storageBucket: 'loginfirebase-1b71b.firebasestorage.app',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCQBYuAPzrBE-tnqyzpPP20T4bnCmI_nxI',
    appId: '1:675954426803:web:cddef4664b2cb6930381c6',
    messagingSenderId: '675954426803',
    projectId: 'loginfirebase-1b71b',
    authDomain: 'loginfirebase-1b71b.firebaseapp.com',
    storageBucket: 'loginfirebase-1b71b.firebasestorage.app',
  );
}