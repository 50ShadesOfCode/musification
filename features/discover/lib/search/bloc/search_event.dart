import 'package:flutter/foundation.dart';

@immutable
abstract class SearchEvent {}

class InitEvent extends SearchEvent {}

class RemoveHistoryElementEvent extends SearchEvent {
  final int index;

  RemoveHistoryElementEvent({
    required this.index,
  });
}

class OnSearchPressedEvent extends SearchEvent {
  final String searchValue;

  OnSearchPressedEvent({
    required this.searchValue,
  });
}

class UpdateSearchEvent extends SearchEvent {
  final String searchValue;

  UpdateSearchEvent({
    required this.searchValue,
  });
}
