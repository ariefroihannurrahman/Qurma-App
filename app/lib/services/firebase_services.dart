import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './config.dart';

class AuthService {
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: FirebaseConfiguration().clientId
    );
    final GoogleSignInAccount? gUser = await googleSignIn.signIn();

    if (gUser == null) {
      // User canceled the sign-in
      return null;
    }

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}