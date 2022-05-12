import 'package:flutter/material.dart';

class SplashForm extends StatefulWidget {
  const SplashForm({Key? key}) : super(key: key);

  @override
  State<SplashForm> createState() => _SplashFormState();
}

class _SplashFormState extends State<SplashForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.symmetric(
              vertical: 2,
            ),
            child: const Image(
              image: AssetImage('assets/images/png/4.0x/logo.png'),
            ),
        ),
      ),
    );
  }
}
