import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class google {
  final googleSignIn = GoogleSignIn(
    clientId:
        '510156006786-ego2cho0h4r0hfl5bf1rdk3uor75notl.apps.googleusercontent.com',
  );
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future signInWithGoogle() async {
    // final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // final GoogleSignInAuthentication gauth = await gUser!.authentication;
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: gauth.accessToken,
    //   idToken: gauth.idToken,
    // );
    final googleuser = await googleSignIn.signIn();
    if (googleuser == null) return;
    _user = googleuser;
    final googleAuth = await googleuser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
