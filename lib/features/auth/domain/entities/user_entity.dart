import '../../data/models/user_model.dart';

class UserEntity {
  final String uid;
  final String email;
  final String? displayName;

  UserEntity({
    required this.uid,
    required this.email,
    this.displayName,
});

  factory UserEntity.fromModel(UserModel userModel){
    return UserEntity(
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

