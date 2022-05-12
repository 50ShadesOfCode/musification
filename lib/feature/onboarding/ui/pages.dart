import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> pages = <PageViewModel>[
  PageViewModel(
    titleWidget: Text(
      texts[0],
      textAlign: TextAlign.center,
      style: AppFonts.headline1,
    ),
    image: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: Image(
          image: AssetImage(icons[0]),
        )),
    bodyWidget: dots[0],
  ),
  PageViewModel(
    titleWidget: Text(
      texts[1],
      textAlign: TextAlign.center,
      style: AppFonts.headline1,
    ),
    image: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: Image(
          image: AssetImage(icons[1]),
        )),
    bodyWidget: dots[1],
  ),
  PageViewModel(
    titleWidget: Text(
      texts[2],
      textAlign: TextAlign.center,
      style: AppFonts.headline1,
    ),
    image: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.symmetric(
          vertical: 2,
        ),
        child: Image(
          image: AssetImage(icons[2]),
        )),
    bodyWidget: dots[2],
  ),
];

const List<String> icons = <String>[
  'assets/images/png/music_folder.png',
  'assets/images/png/like.png',
  'assets/images/png/earphone.png',
];
List<String> texts = <String>[
  AppLocalizations.ofGlobalContext('onboarding_text_1'),
  AppLocalizations.ofGlobalContext('onboarding_text_2'),
  AppLocalizations.ofGlobalContext('onboarding_text_3'),
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
