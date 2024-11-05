import 'package:a_couple_tasks/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:a_couple_tasks/features/auth/presentation/bloc/auth_event.dart';
import 'package:a_couple_tasks/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState> (
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Pasword'),
                obscureText: true,
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthSignInWithGoogle());
                  },
                  child: const Text('Sign in with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
