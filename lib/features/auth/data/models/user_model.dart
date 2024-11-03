import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String? displayName;

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
  });

  // Factory constructor to create a UserModel from Firebase User
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email!,
      displayName: user.displayName,
    );
  }

  // Convert UserModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
    };
  }

  // Factory constructor to create a UserModel from a Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
    );
  }
}
