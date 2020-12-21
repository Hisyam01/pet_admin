import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static FacebookLogin facebookLogin = FacebookLogin();

  // buat akun
  static Future<SignInSignUpResult> createUser({String email, String pass}) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  // login dengan email/password
  static Future<SignInSignUpResult> signInWithEmail({String email, String pass}) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  // sign out
  static void signOut() {
    auth.signOut();
  }

  // sign in dengan google
  static Future<SignInSignUpResult> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final UserCredential result = await auth.signInWithCredential(credential);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  // sign out google
  static Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
  }

}

class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
