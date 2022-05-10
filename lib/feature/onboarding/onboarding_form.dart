import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_dependencies/bloc.dart';

import 'ui/pages.dart';

class OnboardingForm extends StatefulWidget {
  @override
  OnboardingFormState createState() => OnboardingFormState();
}

class OnboardingFormState extends State<OnboardingForm> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (BuildContext context, OnboardingState state) {
        return IntroductionScreen(
          key: introKey,
          pages: pages,
          showBackButton: false,
          showNextButton: false,
          showDoneButton: false,
          isProgress: false,
          globalHeader: Align(
            alignment: Alignment.topRight,
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(
                right: 20,
                top: 15,
              ),
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<OnboardingBloc>(context).add(SkipEvent());
                },
                child: Text(
                  AppLocalizations.of(context).translate('skip')!,
                  textAlign: TextAlign.center,
                  style: AppFonts.button,
                ),
              ),
            ),
          ),
          globalFooter: Container(
            padding: const EdgeInsets.only(
              bottom: 60,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.accent,
                ),
                fixedSize: MaterialStateProperty.all<Size>(const Size(130, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: AppColors.accent),
                  ),
                ),
              ),
              onPressed: () {
                if (introKey.currentState!.controller.page!.toInt() < 2) {
                  introKey.currentState!.animateScroll(
                      introKey.currentState!.controller.page!.toInt() + 1);
                }
                BlocProvider.of<OnboardingBloc>(context).add(AddEvent());
              },
              child: Text(
                AppLocalizations.of(context).translate('next')!,
                style: AppFonts.button,
              ),
            ),
          ),
        );
      },
    );
  }
}
