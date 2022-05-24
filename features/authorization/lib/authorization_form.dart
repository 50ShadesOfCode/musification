import 'package:authorization/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/bloc.dart';

class AuthForm extends StatelessWidget {

  const AuthForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {
          return const Center(
            child: Text('Auth'),
          );
        },
      ),
    );
  }
}
