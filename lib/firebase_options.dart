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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcBVt331JDsA7JjJxlSSA_QvJN-hDzP8M',
    appId: '1:601950023502:android:8add2967aac4e208bef81f',
    messagingSenderId: '601950023502',
    projectId: 'criccoin-35690',
    storageBucket: 'criccoin-35690.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwxLu-95D0EhG2mWpiqOVWmp8-wRgm2fM',
    appId: '1:601950023502:ios:b639056a52a10166bef81f',
    messagingSenderId: '601950023502',
    projectId: 'criccoin-35690',
    storageBucket: 'criccoin-35690.appspot.com',
    androidClientId: '601950023502-5pgafcl59ccho8e77d8qhpgvoovjtfr2.apps.googleusercontent.com',
    iosClientId: '601950023502-fnon575a11ape6fbk4k3so8rekiv90l4.apps.googleusercontent.com',
    iosBundleId: 'com.prism.criccoin',
  );
}
