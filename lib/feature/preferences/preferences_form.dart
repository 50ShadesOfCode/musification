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
  final List<String> _genreTitles = <String>[
    'Punk',
    'Indie',
    'Metal',
    'Pop',
    'Rap',
    'Alternative',
    'Rock',
    'Electronic',
    'Folk',
    'Chillout',
    'Jazz',
    'Classical',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.ofGlobalContext('chooseGenres'),
          style: AppFonts.headline3,
        ),
      ),
      body: BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (BuildContext context, PreferencesState state) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: Column(children: <Widget>[
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 112,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GenreCard(
                      index: index,
                      title: _genreTitles[index],
                    );
                  }),
              Visibility(
                visible: state.isDoneButtonVisible,
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<PreferencesBloc>(context)
                        .add(DoneChoosingEvent());
                  },
                  child: Text(
                    AppLocalizations.ofGlobalContext('done'),
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
