import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OnboardingForm extends StatefulWidget {
  @override
  OnboardingFormState createState() => OnboardingFormState();
}

class OnboardingFormState extends State<OnboardingForm> {
  late int _pageIndex;

  @override
  void initState() {
    super.initState();
    _pageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            actions: <Widget>[
              TextButton(
                child: const Text('Skip'),
                onPressed: () => {},
              )
            ],
          ),
          backgroundColor: const Color(0xff2c1f35),
          body: Column(
            children: <Widget>[
              Center(
                child: Column(),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: const Text("Next"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.accent),
                ),
              )
            ],
          )),
    );
  }
}
