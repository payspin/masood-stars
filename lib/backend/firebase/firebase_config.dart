import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDjXlIFzOdkJqbkckOMd6pZgEh5w89XRgc",
            authDomain: "oozf-aaff4.firebaseapp.com",
            projectId: "oozf-aaff4",
            storageBucket: "oozf-aaff4.appspot.com",
            messagingSenderId: "302414225946",
            appId: "1:302414225946:web:b2287eb60c20c60b6027a3",
            measurementId: "G-DW0M0E1B36"));
  } else {
    await Firebase.initializeApp();
  }
}
