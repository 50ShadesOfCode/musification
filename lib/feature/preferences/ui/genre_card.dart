import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_svg/flutter_svg.dart';
=======
>>>>>>> 176816e (Add genre preferences screen.)
import 'package:fpmi_music_band/feature/preferences/bloc/preferences_bloc.dart';
import 'package:shared_dependencies/bloc.dart';

class GenreCard extends StatefulWidget {
  final int index;
  final String title;
  const GenreCard({
    required this.index,
    required this.title,
  });

  @override
  GenreCardState createState() => GenreCardState();
}

class GenreCardState extends State<GenreCard> {
  late int index;
  late String title;

<<<<<<< HEAD
  late bool isVisible;

=======
>>>>>>> 176816e (Add genre preferences screen.)
  @override
  void initState() {
    super.initState();
    index = widget.index;
    title = widget.title;
<<<<<<< HEAD
    isVisible = false;
=======
>>>>>>> 176816e (Add genre preferences screen.)
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
<<<<<<< HEAD
        if (!isVisible) {
          BlocProvider.of<PreferencesBloc>(context)
              .add(ChooseGenreEvent(title: title.toLowerCase()));
        } else {
          BlocProvider.of<PreferencesBloc>(context)
              .add(UnchooseGenreEvent(title: title.toLowerCase()));
        }
        isVisible = !isVisible;
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 98,
                  height: 98,
                  margin: const EdgeInsets.only(
                      top: 8, bottom: 16, left: 8, right: 8),
                  child: Image.asset(
                    AppImages.genreImageList[index],
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
=======
        BlocProvider.of<PreferencesBloc>(context)
            .add(ChooseGenreEvent(title: title.toLowerCase()));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(20),
            // ),
            width: 98,
            height: 98,
            margin: const EdgeInsets.all(8),
            child: Image.asset(
              AppImages.genreImageList[index],
            ),
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
>>>>>>> 176816e (Add genre preferences screen.)
      ),
    );
  }
}