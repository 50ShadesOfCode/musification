import 'package:authorization/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthForm extends StatelessWidget {
  const AuthForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthorizationState>(
        builder: (BuildContext context, AuthorizationState state) {
          if (state.needRegistration) {
            return const SafeArea(
              child: WebView(
                initialUrl: 'https://www.last.fm/join',
                javascriptMode: JavascriptMode.unrestricted,
                // TODO: Close WebView after login
              ),
            ); // TODO: Add internet_connection exception
          }
          //TODO: Add login UI
          return Scaffold(
            body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text('login page'),
              ElevatedButton(onPressed: ()=> {BlocProvider.of<AuthBloc>(context).add(RegisterEvent())}, child: Text('register'))
            ]),),
          );
        },
      ),
    );
  }
}
