import 'package:shared_dependencies/utils.dart';

class PreferencesState extends Equatable {
  final int chosenGenresAmount;
<<<<<<< HEAD
  List<String> chosenGenres;
  final bool isDoneButtonVisible;
  PreferencesState({
=======
  final List<String> chosenGenres;
  final bool isDoneButtonVisible;
  const PreferencesState({
>>>>>>> 176816e (Add genre preferences screen.)
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
