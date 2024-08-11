
import 'package:block_demo_dharmesh/export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widget/common.dart';


class AuthServices {
  final _auth = FirebaseAuth.instance;

  Future signOut(bool signOut , BuildContext context) async {
    if (signOut) {
      await API.logOutApi().then((value) async {
        if (value != null) {
          if (_googleSignIn.currentUser != null) {
            await googleSignOut();
          } else if (_auth.currentUser != null) {
            await _auth.signOut();
          }
          await LSProvider.removeSharedPre().then((value) {
            GetNav.offNamed(context ,Routes.authMainScreen);
          });
        }
      });
    } else {
      if (_googleSignIn.currentUser != null) {
        await googleSignOut();
      } else if (_auth.currentUser != null) {
        await _auth.signOut();
      }
    }
  }

  googleSignOut() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      await googleSignOut();
    }
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      await _auth.signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken));
      return googleSignInAccount;
    } catch (e) {
      return null;
    }
  }


}
