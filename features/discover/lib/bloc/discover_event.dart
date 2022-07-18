import 'package:flutter/foundation.dart';

@immutable
abstract class DiscoverEvent {}

class SearchPressedEvent extends DiscoverEvent {}

class CancelPressedEvent extends DiscoverEvent {}
