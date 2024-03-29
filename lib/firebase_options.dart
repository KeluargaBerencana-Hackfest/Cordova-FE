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
    apiKey: 'AIzaSyAbrbY8_HZyvMsurmScNVQFN-UzIPmE5Pk',
    appId: '1:444182421044:web:ce9658c572c5f12655b461',
    messagingSenderId: '444182421044',
    projectId: 'hackfest-2023-409516',
    authDomain: 'hackfest-2023-409516.firebaseapp.com',
    storageBucket: 'hackfest-2023-409516.appspot.com',
    measurementId: 'G-0KDZB4MWDC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHxhc5Ls4VriK8UCFeSa6dmBn5T-Ys-Ms',
    appId: '1:444182421044:android:c681667c6c456dd855b461',
    messagingSenderId: '444182421044',
    projectId: 'hackfest-2023-409516',
    storageBucket: 'hackfest-2023-409516.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2nSANSuHTAMLxaEdXYXqzGVvTK4iQ-yQ',
    appId: '1:444182421044:ios:89aad69265f3a09d55b461',
    messagingSenderId: '444182421044',
    projectId: 'hackfest-2023-409516',
    storageBucket: 'hackfest-2023-409516.appspot.com',
    iosClientId: '444182421044-sl90ctka8a6rlojn869ip26oo4c7bjb1.apps.googleusercontent.com',
    iosBundleId: 'com.example.cordova',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2nSANSuHTAMLxaEdXYXqzGVvTK4iQ-yQ',
    appId: '1:444182421044:ios:d45cb3d0af8d213e55b461',
    messagingSenderId: '444182421044',
    projectId: 'hackfest-2023-409516',
    storageBucket: 'hackfest-2023-409516.appspot.com',
    iosClientId: '444182421044-50b7pepiv8p4tjl1q680bpj8t291lk9c.apps.googleusercontent.com',
    iosBundleId: 'com.example.cordova.RunnerTests',
  );
}
