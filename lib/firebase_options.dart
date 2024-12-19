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
    apiKey: 'AIzaSyDuFT3UAqDwpxjfV0JM-UyRqq4ZaTC2H4w',
    appId: '1:707453952108:web:5dc06cd9f06c770138b849',
    messagingSenderId: '707453952108',
    projectId: 'trible-e52c6',
    authDomain: 'trible-e52c6.firebaseapp.com',
    storageBucket: 'trible-e52c6.appspot.com',
    measurementId: 'G-XD69GVJWEL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPClM35nzBVXxxFZ5CUYhmRwkLeDk2OkM',
    appId: '1:707453952108:android:b65450dc062af08538b849',
    messagingSenderId: '707453952108',
    projectId: 'trible-e52c6',
    storageBucket: 'trible-e52c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJnr4LYpixjv4_08L6-9WIa5d-ooWMBQI',
    appId: '1:707453952108:ios:1e853d9b160adf1b38b849',
    messagingSenderId: '707453952108',
    projectId: 'trible-e52c6',
    storageBucket: 'trible-e52c6.appspot.com',
    iosClientId: '707453952108-fbmsngfirta0tafjds4s0l75h10hh6mh.apps.googleusercontent.com',
    iosBundleId: 'com.example.trible',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJnr4LYpixjv4_08L6-9WIa5d-ooWMBQI',
    appId: '1:707453952108:ios:1e853d9b160adf1b38b849',
    messagingSenderId: '707453952108',
    projectId: 'trible-e52c6',
    storageBucket: 'trible-e52c6.appspot.com',
    iosClientId: '707453952108-fbmsngfirta0tafjds4s0l75h10hh6mh.apps.googleusercontent.com',
    iosBundleId: 'com.example.trible',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDuFT3UAqDwpxjfV0JM-UyRqq4ZaTC2H4w',
    appId: '1:707453952108:web:11af751bb4052f4838b849',
    messagingSenderId: '707453952108',
    projectId: 'trible-e52c6',
    authDomain: 'trible-e52c6.firebaseapp.com',
    storageBucket: 'trible-e52c6.appspot.com',
    measurementId: 'G-JSBBW5CFZE',
  );
}
