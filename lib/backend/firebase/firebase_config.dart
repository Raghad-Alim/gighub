import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCxMEOZziu5_iwxIKhFULXRMaq4ZYA6vzQ",
            authDomain: "gighub-c99e9.firebaseapp.com",
            projectId: "gighub-c99e9",
            storageBucket: "gighub-c99e9.appspot.com",
            messagingSenderId: "316503176889",
            appId: "1:316503176889:web:9dd2784c6d3c34736ccd68",
            measurementId: "G-ZQCGKR0741"));
  } else {
    await Firebase.initializeApp();
  }
}
