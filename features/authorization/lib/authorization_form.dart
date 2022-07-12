import 'package:authorization/bloc/auth_bloc.dart';
import 'package:authorization/ui/auth_input_field.dart';
import 'package:authorization/ui/divider.dart';
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
                    Container(
                      margin: const EdgeInsets.only(bottom: 32),
                      width: 200,
                      height: 200,
                      child: Image.asset(AppImages.logoPngKey),
                    ),
                    AuthInputField(
                      controller: usernameController,
                      func: (String text) {
                        username = text;
                      },
                    ),
                    AuthInputField(
                      controller: passwordController,
                      func: (String text) {
                        password = text;
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 180),
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
                            backgroundColor: AppTheme.accentColor,
                            primary: AppTheme.activeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: Text(AppLocalizations.ofGlobalContext('signin')),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AuthDivider(),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            AppLocalizations.ofGlobalContext('or'),
                            style: const TextStyle(
                              color: AppTheme.secondaryColor1,
                            ),
                          ),
                        ),
                        AuthDivider(),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            AppLocalizations.ofGlobalContext('notregistered'),
                            style: const TextStyle(
                              color: AppTheme.secondaryColor1,
                            ),
                          ),
                          TextButton(
                            onPressed: () => <void>{
                              BlocProvider.of<AuthBloc>(context)
                                  .add(RegisterEvent())
                            },
                            style: TextButton.styleFrom(
                              primary: AppTheme.activeColor,
                            ),
                            child: Text(
                              AppLocalizations.ofGlobalContext('register'),
                            ),
                          ),
                        ],
                      ),
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
