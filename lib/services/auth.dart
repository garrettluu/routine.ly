import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Start the google sign in flow and return the firebase user when finished
  Future<FirebaseUser> googleSignIn() async {
    //Get google account
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    //Get authentication details
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    //Generate Auth credentials
    final AuthCredential credential =
      GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    //Get the firebase user and return
    AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    return user;
  }
}

final AuthService authService = AuthService();