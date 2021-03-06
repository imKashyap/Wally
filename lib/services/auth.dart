import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wally/models/viewer.dart';

abstract class AuthBase {
  Stream<User> getCurrentAuthState();
  Viewer getCurrentUser();
  Future<User> signInWithGoogle();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Stream<User> getCurrentAuthState() {
    return _auth.authStateChanges();
  }

  Viewer _getUserFromFirebase(User user) {
    if (user == null) return null;
    return Viewer(
      uid: user.uid,
      email: user.email,
      imgUrl: user.photoURL,
      name: user.displayName,
    );
  }

  @override
  Viewer getCurrentUser() {
     return _getUserFromFirebase(_auth.currentUser);
  }

  @override
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final UserCredential userCreds = await _auth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));
        return userCreds.user;
      } else
        throw PlatformException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKENS',
            message: 'Google auth tokens are missing');
    } else
      throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
