import 'package:a_couple_tasks/features/auth/data/repositories/user_repository_impl.dart';
import 'package:a_couple_tasks/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:a_couple_tasks/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:a_couple_tasks/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:a_couple_tasks/features/auth/presentation/bloc/auth_event.dart';
import 'package:a_couple_tasks/features/auth/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(
            signInUsecase: SignInUsecase(
                userRepository: UserRepositoryImpl(
                    firebaseAuth: FirebaseAuth.instance, 
                    googleSignIn: GoogleSignIn()
                ),
            ),
          signUpUsecase: SignUpUsecase(
              userRepository: UserRepositoryImpl(
                  firebaseAuth: FirebaseAuth.instance,
                  googleSignIn: GoogleSignIn(),
              ),
          ),
          firebaseAuth: FirebaseAuth.instance,
        )..add(AuthStarted()),
      child: MaterialApp(
        title: 'A Couple Tasks',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Home page'),
            ),
            body: const Center(
              child: Text('Home page under construction'),
            ),
          ),
        },
      ),
    );
  }
}
