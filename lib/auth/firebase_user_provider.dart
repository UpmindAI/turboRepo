import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DigitalVenturesFirebaseUser {
  DigitalVenturesFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

DigitalVenturesFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DigitalVenturesFirebaseUser> digitalVenturesFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<DigitalVenturesFirebaseUser>(
      (user) {
        currentUser = DigitalVenturesFirebaseUser(user);
        return currentUser!;
      },
    );
