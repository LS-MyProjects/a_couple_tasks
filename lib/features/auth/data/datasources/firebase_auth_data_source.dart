import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthDataSource({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
}) : _firebaseAuth = firebaseAuth, _googleSignIn = googleSignIn;

  Stream<UserModel?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((user) {
      return user != null ? UserModel.fromFirebaseUser(user) : null;
    });
  }

  Future<UserModel> signInWithEmail(String email, String password) async {
    try{
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password
      );

      if (userCredential.user == null){
        throw Exception("Failed to login: null user");
      }

      return UserModel.fromFirebaseUser(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw Exception("Failed to login: ${e.message}");
    }
  }
  Future<UserModel> signUpWithEmail(String email, String password) async {
    try{
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null){
        throw Exception("Failed to login: null user");
      }

      return UserModel.fromFirebaseUser(userCredential.user!);
    } on FirebaseAuthException catch(e) {
      throw Exception("Failed to login: ${e.message}");
    }
  }

  Future<UserModel> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception("Google sign-in aborted");
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user == null){
        throw Exception("Failed to login: null user");
      }

      return UserModel.fromFirebaseUser(userCredential.user!);
    } on FirebaseAuthException catch(e) {
      throw Exception("Failed to login: ${e.message}");
    }

  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}