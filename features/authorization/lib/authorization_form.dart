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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(AppImages.logoPngKey),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
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
                            borderSide: BorderSide.none,
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
                    SizedBox(
                      width: 350,
                      height: 40,
                      child: TextButton(
                        onPressed: () => <void>{
                            BlocProvider.of<AuthBloc>(context).add(SignInEvent(
                              username: username,
                              password: password,
                            )),
                          },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          primary: AppColors.active,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                        ),
                        child: const Text('Sign In'),
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 150,
                          child: Divider(
                            thickness: 1,
                            color: AppColors.secondary1,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'or',
                          style: TextStyle(
                            color: AppColors.secondary1,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 150,
                          child: Divider(
                            thickness: 1,
                            color: AppColors.secondary1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: AppColors.secondary1,
                          ),
                        ),
                        TextButton(
                          onPressed: () => <void>{
                            BlocProvider.of<AuthBloc>(context).add(RegisterEvent())
                          },
                          style: TextButton.styleFrom(
                            primary: AppColors.active,
                          ),
                          child: const Text(
                            'Register',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
