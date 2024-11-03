import 'package:a_couple_tasks/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthLoggedIn extends AuthEvent {
  final UserEntity user;

  AuthLoggedIn({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthLoggedOut extends AuthEvent{}

class AuthSignInWithGoogle extends AuthEvent{}

class AuthSignUpWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpWithEmailAndPassword({
    required this.email,
    required this.password
  });

  @override
  List<Object?> get props => [email, password];
}

class AuthSignInWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  AuthSignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}