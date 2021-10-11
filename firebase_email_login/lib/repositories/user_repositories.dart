import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  UserRepository({required this.firebaseAuth});

  //Sign Up with email and Password
  Future<User?> signUp({
    String? email,
    String? password,
  }) async {
    try {
      var auth = await firebaseAuth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

  //Sign In with email and password

  Future<User?> signIn(String email, String password) async {
    try {
      var auth = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return auth.user;
    } catch (e) {
      print(e.toString());
    }
  }

  //Logout firebase

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  //Check Sign In
  Future<bool> isSignedIn() async {
    var currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }

  //Get current User
  Future<User?> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }
}
