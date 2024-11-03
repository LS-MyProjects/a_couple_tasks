import 'package:a_couple_tasks/features/auth/domain/entities/user_entity.dart';
import 'package:a_couple_tasks/features/auth/domain/repositories/user_repository.dart';

class SignInUsecase {
  final UserRepository _userRepository;

  SignInUsecase({
    required UserRepository userRepository,
}) : _userRepository = userRepository;

  Future<UserEntity> call({
    required String email,
    required String password,
}) async {
    return UserEntity.fromModel(
        await _userRepository.signInWithEmail(email, password)
    );
  }

  Future<UserEntity> singInWithGoogle() async {
    return UserEntity.fromModel(await _userRepository.signInWithGoogle());
  }
}