import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpmi_music_band/feature/preferences/bloc/preferences_bloc.dart';
import 'package:shared_dependencies/bloc.dart';

class GenreCard extends StatefulWidget {
  final int picture;
  final String title;
  const GenreCard({
    required this.picture,
    required this.title,
  });

  @override
  GenreCardState createState() => GenreCardState();
}

class GenreCardState extends State<GenreCard> {
  late int picture;
  late String title;

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    picture = widget.picture;
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isVisible) {
          BlocProvider.of<PreferencesBloc>(context).add(
            ChooseGenreEvent(
              title: title.toLowerCase(),
            ),
          );
        } else {
          BlocProvider.of<PreferencesBloc>(context).add(
            UnchooseGenreEvent(
              title: title.toLowerCase(),
            ),
          );
        }
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 98,
                  height: 98,
                  margin: const EdgeInsets.only(
                    top: 8,
                    bottom: 16,
                    left: 8,
                    right: 8,
                  ),
                  child: Image.asset(
                    AppImages.genreImageList[picture],
                    width: 98,
                    height: 98,
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: SvgPicture.asset(AppImages.circleCheckKey),
                )
              ],
            ),
            Container(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppTheme.activeColor,
                ),
              ),
              margin: const EdgeInsets.only(bottom: 8),
            )
          ],
        ),
      ),
    );
  }
}
