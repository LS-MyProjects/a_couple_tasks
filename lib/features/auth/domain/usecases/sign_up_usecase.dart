import 'package:a_couple_tasks/features/auth/domain/entities/user_entity.dart';
import 'package:a_couple_tasks/features/auth/domain/repositories/user_repository.dart';

class SignUpUsecase {
  final UserRepository _userRepository;

  SignUpUsecase({
    required UserRepository userRepository,
}) : _userRepository = userRepository;

  Future<UserEntity> call({required String email, required String password}) async{
    return UserEntity.fromModel(
        await _userRepository.signUpWithEmail(email, password)
    );
  }
}