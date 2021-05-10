import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static signInWithGoogle({@required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount signInAccount = await googleSignIn.signIn();

    if (signInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await signInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(authCredential);
        user = userCredential.user;
        user.getIdToken().then((value) => print(value));
      } on FirebaseAuthException catch (e) {
        print(e.code);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(e.code),
        ));
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here

      }
    }
  }
}
