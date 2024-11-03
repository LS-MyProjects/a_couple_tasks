import 'package:a_couple_tasks/features/auth/data/models/user_model.dart';
import 'package:a_couple_tasks/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:a_couple_tasks/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:a_couple_tasks/features/auth/presentation/bloc/auth_event.dart';
import 'package:a_couple_tasks/features/auth/presentation/bloc/auth_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUsecase _signInUsecase;
  final SignUpUsecase _signUpUsecase;
  final FirebaseAuth _firebaseAuth;

  AuthBloc({
    required SignInUsecase signInUsecase,
    required SignUpUsecase signUpUsecase,
    required FirebaseAuth firebaseAuth,
}) : _signInUsecase = signInUsecase,
  _signUpUsecase = signUpUsecase,
  _firebaseAuth = firebaseAuth,
  super(AuthInitial()) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthSignInWithGoogle>(_onAuthSignInWithGoogle);
    on<AuthSignInWithEmailAndPassword>(_onAuthSignInWithEmailAndPassword);
    on<AuthSignUpWithEmailAndPassword>(_onAuthSignUpWithEmailAndPassword);
    on<AuthLoggedOut>(_onAuthLoggedOut);
  }

  Future<void> _onAuthStarted(AuthStarted event, Emitter<AuthState> emit) async {
    final user = _firebaseAuth.currentUser;
    
    if (user != null) {
      emit(AuthAuthenticated(user: UserEntity.fromModel(UserModel.fromFirebaseUser(user))));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onAuthSignInWithGoogle(AuthSignInWithGoogle event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _signInUsecase.singInWithGoogle();
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onAuthSignInWithEmailAndPassword(AuthSignInWithEmailAndPassword event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try{
      final user = await _signInUsecase.call(email: event.email, password: event.password);
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onAuthSignUpWithEmailAndPassword(AuthSignUpWithEmailAndPassword event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _signUpUsecase.call(email: event.email, password: event.password);
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onAuthLoggedOut(AuthLoggedOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try{
      await _firebaseAuth.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}