import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    index = widget.index;
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
      ),
    );
  }
}
