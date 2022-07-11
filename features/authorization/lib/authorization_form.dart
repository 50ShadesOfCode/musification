import 'package:authorization/bloc/auth_bloc.dart';
import 'package:authorization/ui/input_decoration.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String username = '';
  String password = '';

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
                        decoration: inputDecoration,
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
                        decoration: inputDecoration,
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
                            )),
                        child: Text(AppLocalizations.ofGlobalContext('signin')),
                      ),
                    ),
                    const SizedBox(
                      height: 180,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          width: 150,
                          child: Divider(
                            thickness: 1,
                            color: AppColors.secondary1,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppLocalizations.ofGlobalContext('or'),
                          style: const TextStyle(
                            color: AppColors.secondary1,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const SizedBox(
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
                      children: <Widget>[
                        Text(
                          AppLocalizations.ofGlobalContext('notregistered'),
                          style: const TextStyle(
                            color: AppColors.secondary1,
                          ),
                        ),
                        TextButton(
                          onPressed: () => <void>{
                            BlocProvider.of<AuthBloc>(context)
                                .add(RegisterEvent())
                          },
                          style: TextButton.styleFrom(
                            primary: AppColors.active,
                          ),
                          child: Text(
                            AppLocalizations.ofGlobalContext('register'),
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
