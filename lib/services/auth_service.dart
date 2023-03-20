import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solution_challenge_mciet/screens/home.dart';
import 'package:solution_challenge_mciet/screens/login.dart';

class AuthService {
  // 1. handleAuthState()
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return homePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
  // 2. signInWithGoogle()
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  // 3. signOut()
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}