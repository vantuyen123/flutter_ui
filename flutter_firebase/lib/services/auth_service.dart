import 'package:firebase_auth/firebase_auth.dart';
class AuthService{
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithCredentialGoogle(AuthCredential credential)
  => _auth.signInWithCredential(credential);

  Future<void> logoutGoogle() => _auth.signOut();

  Stream<User?> get currentUserGoogle => _auth.authStateChanges();


  //Facebook:-------------------------------------------------------------------

  Stream<User?> get currentUserFacebook => _auth.authStateChanges();
  Future<UserCredential> signInWithCredentialFacebook(AuthCredential credential) => _auth.signInWithCredential(credential);
  Future<void> logoutFacebook() => _auth.signOut();
}