import '../../data/models/user_model.dart';

class User {
  final String uid;
  final String email;
  final String? displayName;

  User({
    required this.uid,
    required this.email,
    this.displayName,
});

  factory User.fromModel(UserModel userModel){
    return User(
      uid: userModel.uid,
      email: userModel.email,
      displayName: userModel.displayName,
    );
  }

  UserModel toModel() {
    return UserModel(
        uid: uid,
        email: email,
        displayName: displayName,
    );
  }
}

