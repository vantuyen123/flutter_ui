import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/services/auth_service.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc {

  final authService = AuthService();

  final googleSignIn = GoogleSignIn(scopes: ['email']);

  final fbSignIn = FacebookLogin();


  Stream<User?> get currentUserFacebook => authService.currentUserFacebook;
  Stream<User?> get currentUserGoogle => authService.currentUserGoogle;

  //Google:---------------------------------------------------------------------
  loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      //Firebase Sign in
      final result = await authService.signInWithCredentialGoogle(credential);

      print('${result.user!.displayName ?? ''}');
    } catch (e) {
      print(e);
    }
  }

  logoutGoogle() {
    authService.logoutGoogle();
  }

  //Facebook:-------------------------------------------------------------------
  loginFacebook() async {
    final res = await fbSignIn.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email
    ]);

    switch (res.status) {
      case FacebookLoginStatus.success:

        //Get Token
        final FacebookAccessToken? fbToken = res.accessToken;

        //Convert to Auth Credential
        final AuthCredential credential= FacebookAuthProvider.credential(fbToken!.token);

        //User Credential to Sign in with Firebase
        final result = await authService.signInWithCredentialFacebook(credential);

        print('${result.user!.displayName} is now logged in');
        break;
      case FacebookLoginStatus.cancel:
        print('The user canceled the login');
        break;
      case FacebookLoginStatus.error:
        print('There was an error');
        break;
    }


  }
  logoutFacebook(){
    authService.logoutFacebook();
  }
}
