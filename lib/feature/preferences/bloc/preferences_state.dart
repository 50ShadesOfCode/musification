import 'package:shared_dependencies/utils.dart';

class PreferencesState extends Equatable {
  final int chosenGenresAmount;
  List<String> chosenGenres;
  final bool isDoneButtonVisible;
  PreferencesState({
    required this.chosenGenresAmount,
    required this.chosenGenres,
    required this.isDoneButtonVisible,
  });

  PreferencesState copyWith({
    required int chosenGenresAmount,
    required List<String> chosenGenres,
    required bool isDoneButtonVisible,
  }) {
    return PreferencesState(
      chosenGenresAmount: chosenGenresAmount,
      chosenGenres: chosenGenres,
      isDoneButtonVisible: isDoneButtonVisible,
    );
  }

  @override
  List<Object> get props => <Object>[
        chosenGenresAmount,
        chosenGenres,
        isDoneButtonVisible,
      ];
}
