import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:shared_dependencies/bloc.dart';

class OnboardingForm extends StatefulWidget {
  @override
  OnboardingFormState createState() => OnboardingFormState();
}

class OnboardingFormState extends State<OnboardingForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (BuildContext context, OnboardingState state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.main,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(
                      right: 20,
                      top: 15,
                    ),
                    child: TextButton(
                      onPressed: () {
                        BlocProvider.of<OnboardingBloc>(context)
                            .add(SkipEvent());
                      },
                      child: const Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: AppFonts.button,
                      ),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: content(state.index),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xffd90429),
                    ),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(130, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Color(0xffd90429)),
                      ),
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<OnboardingBloc>(context).add(AddEvent());
                  },
                  child: const Text(
                    'Next',
                    style: AppFonts.button,
                  ),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget content(int index) {
  return Expanded(
    flex: 2,
    child: Column(
      children: <Widget>[
        Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.symmetric(
              vertical: 2,
            ),
            child: Image(
              image: AssetImage(icons[index]),
            )),
        const SizedBox(height: 40),
        Text(
          texts[index],
          textAlign: TextAlign.center,
          style: AppFonts.headline1,
        ),
        const SizedBox(height: 40),
        dots[index]
      ],
    ),
  );
}

const List<String> icons = <String>[
  'assets/images/png/music_folder.png',
  'assets/images/png/like.png',
  'assets/images/png/earphone.png',
];
const List<String> texts = <String>[
  'Music collected\nespecially for you',
  'Sound\nthat pleases',
  'Listen on any device\neven without internet',
];
List<Widget> dots = <Widget>[
  Container(
    width: 56,
    height: 8,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 24,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffedf2f4),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff8d99ae),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff8d99ae),
          ),
        ),
      ],
    ),
  ),
  Container(
    width: 56,
    height: 46,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 56,
          height: 8,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff8d99ae),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff8d99ae),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 24,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffedf2f4),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 11),
        Container(
          width: 56,
          height: 8,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff8d99ae),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 24,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffedf2f4),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff8d99ae),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 11),
        Container(
          width: 56,
          height: 8,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 24,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffedf2f4),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff8d99ae),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff8d99ae),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
  Container(
    width: 56,
    height: 8,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff8d99ae),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff8d99ae),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 24,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffedf2f4),
          ),
        ),
      ],
    ),
  )
];
