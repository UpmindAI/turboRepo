import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAuckHy4G6VzEqST4K77H-A6QqFzWV-osY",
            authDomain: "digitalventures-3ffee.firebaseapp.com",
            projectId: "digitalventures-3ffee",
            storageBucket: "digitalventures-3ffee.appspot.com",
            messagingSenderId: "60142140485",
            appId: "1:60142140485:web:c576c3e451258cdb86b72c",
            measurementId: "G-TBPJFCQT57"));
  } else {
    await Firebase.initializeApp();
  }
}
