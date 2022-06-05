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
            return SafeArea(
              child: WebView(
                initialUrl: 'https://www.last.fm/join',
                javascriptMode: JavascriptMode.unrestricted,
                gestureNavigationEnabled: true,
                navigationDelegate: (NavigationRequest request) {
                  if (request.url.contains('user')) {
                    BlocProvider.of<AuthBloc>(context).add(OnRegisteredEvent());
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
                //TODO: Use connectivity package for no internet case
                onWebResourceError: (WebResourceError error) => <void>{
                  BlocProvider.of<AuthBloc>(context).add(ConnectionErrorEvent())
                },
              ),
            );
          }
          //TODO: Add login page
          return Scaffold(
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('login page'),
                    ElevatedButton(
                      onPressed: () => <void>{
                        BlocProvider.of<AuthBloc>(context).add(RegisterEvent())
                      },
                      child: const Text('Register'),
                    ),
                    ElevatedButton(
                        onPressed: () => <void>{
                              //TODO: SignIn form
                              BlocProvider.of<AuthBloc>(context).add(
                                SignInEvent(
                                    username: 'artyomkaktysh',
                                    password: 'zte14858_'),
                              ),
                            },
                        child: const Text('Sign In'))
                  ]),
            ),
          );
        },
      ),
    );
  }
}
