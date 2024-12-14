import 'package:bloc_state_management/Login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  late LoginBloc loginBloc;
  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => loginBloc,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (curr, prev) {
                  return curr.email != prev.email;
                },
                builder: (context, state) {
                  return TextFormField(
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                            EmailChangeEvent(
                              email: value,
                            ),
                          );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (curr, prev) => curr.password != prev.password,
                builder: (context, state) {
                  return TextFormField(
                    focusNode: passwordFocusNode,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                            PasswordChangeEvent(
                              password: value,
                            ),
                          );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
