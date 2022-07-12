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
<<<<<<< HEAD
    AppLocalizations.ofGlobalContext('punk'),
    AppLocalizations.ofGlobalContext('indie'),
    AppLocalizations.ofGlobalContext('metal'),
    AppLocalizations.ofGlobalContext('pop'),
    AppLocalizations.ofGlobalContext('rap'),
    AppLocalizations.ofGlobalContext('alternative'),
    AppLocalizations.ofGlobalContext('rock'),
    AppLocalizations.ofGlobalContext('electronic'),
    AppLocalizations.ofGlobalContext('folk'),
    AppLocalizations.ofGlobalContext('chillout'),
    AppLocalizations.ofGlobalContext('jazz'),
    AppLocalizations.ofGlobalContext('classical'),
=======
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
>>>>>>> 176816e (Add genre preferences screen.)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      resizeToAvoidBottomInset: false,
=======
>>>>>>> 176816e (Add genre preferences screen.)
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
<<<<<<< HEAD
              Container(
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      mainAxisExtent: 146,
                    ),
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return GenreCard(
                        index: index,
                        title: _genreTitles[index],
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
=======
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
>>>>>>> 176816e (Add genre preferences screen.)
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
