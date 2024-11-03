import 'package:a_couple_tasks/features/auth/domain/entities/user.dart';
import 'package:a_couple_tasks/features/auth/domain/repositories/user_repository.dart';

class SingUpUsecase {
  final UserRepository _userRepository;

  SingUpUsecase({
    required UserRepository userRepository,
}) : _userRepository = userRepository;

  Future<User> call({required String email, required String password}) async{
    return User.fromModel(
        await _userRepository.signUpWithEmail(email, password)
    );
  }
}