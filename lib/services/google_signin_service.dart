import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  static Future<GoogleSignInAccount> signInWithGoogle() async {
    try {
      final GoogleSignInAccount account = await _googleSignIn.signIn();
      final googleKey = await account.authentication;

      //print('======== ID TOKEN ========');
      //print(account);
      //print(googleKey.idToken);

      //TODO : idToken

      return account;
    } catch (e) {
      print('Error en google Signin');
      print(e);
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
