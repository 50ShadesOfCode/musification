import 'package:authorization/bloc/auth_bloc.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String username = ''; // artyomkaktysh
  String password = ''; // zte14858_

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              ),
            );
          }
          return SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 350,
                    height: 40,
                    child: TextField(
                      controller: usernameController,
                      onChanged: (String text) {
                        username = text;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Username',
                        fillColor: AppColors.secondary2,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 350,
                    height: 40,
                    child: TextField(
                      controller: passwordController,
                      onChanged: (String text) {
                        password = text;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Password',
                        fillColor: AppColors.secondary2,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () => <void>{
                      BlocProvider.of<AuthBloc>(context).add(SignInEvent(
                        username: username,
                        password: password,
                      )),
                    },
                    child: const Text('Sign In'),
                  ),
                  const SizedBox(
                    height: 160,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        onPressed: () => <void>{
                          BlocProvider.of<AuthBloc>(context).add(RegisterEvent())
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 128,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
