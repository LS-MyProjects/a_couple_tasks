import 'package:a_couple_tasks/features/auth/domain/entities/user.dart';
import 'package:a_couple_tasks/features/auth/domain/repositories/user_repository.dart';

class SignInUsecase {
  final UserRepository _userRepository;

  SignInUsecase({
    required UserRepository userRepository,
}) : _userRepository = userRepository;

  Future<User> call({
    required String email,
    required String password,
}) async {
    return User.fromModel(
        await _userRepository.signInWithEmail(email, password)
    );
  }

  Future<User> singInWithGoogle() async {
    return User.fromModel(await _userRepository.signInWithGoogle());
  }
}