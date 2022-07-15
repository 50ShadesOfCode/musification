import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/preferences/bloc/preferences_bloc.dart';
import 'package:fpmi_music_band/feature/preferences/ui/genre_card.dart';
import 'package:shared_dependencies/bloc.dart';

class PreferencesForm extends StatefulWidget {
  @override
  PreferencesFormState createState() => PreferencesFormState();
}

class PreferencesFormState extends State<PreferencesForm> {
  final List<String> _genres = <String>[
    'punk',
    'indie',
    'metal',
    'pop',
    'rap',
    'alternative',
    'rock',
    'electronic',
    'folk',
    'chillout',
    'jazz',
    'classical',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          AppLocalizations.ofGlobalContext('chooseGenres'),
          style: AppFonts.sfUi18Bold.copyWith(
            color: AppTheme.activeColor,
          ),
        ),
      ),
      body: BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (BuildContext context, PreferencesState state) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Container(
                  child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150,
                        mainAxisExtent: 146,
                      ),
                      itemCount: _genres.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GenreCard(
                          picture: index,
                          genre: _genres[index],
                        );
                      }),
                  margin: const EdgeInsets.only(bottom: 80),
                ),
                Container(
                  width: 130,
                  height: 45,
                  child: Visibility(
                    visible: state.isDoneButtonVisible,
                    child: TextButton(
                      style: AppStyles.doneTextButtonStyle,
                      onPressed: () {
                        BlocProvider.of<PreferencesBloc>(context)
                            .add(DoneChoosingEvent());
                      },
                      child: Text(
                        AppLocalizations.ofGlobalContext('done'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
