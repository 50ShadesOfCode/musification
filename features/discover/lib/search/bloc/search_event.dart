import 'package:flutter/foundation.dart';

@immutable
abstract class SearchEvent {}

class InitEvent extends SearchEvent {}

class RemoveHistoryElementEvent extends SearchEvent {}

class UpdateSearchEvent extends SearchEvent {
  final String searchValue;

  UpdateSearchEvent({
    required this.searchValue,
  });
}
