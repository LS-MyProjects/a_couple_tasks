import 'package:a_couple_tasks/features/auth/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> signInWithEmail(String email, String password);
  Future<UserModel> signUpWithEmail(String email, String password);
  Future<UserModel> signInWithGoogle();
  Future<void> signOut();
  Stream<UserModel?> authStateChanges();
}