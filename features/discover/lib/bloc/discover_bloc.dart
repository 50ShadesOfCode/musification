import 'package:flutter/material.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

import 'discover_event.dart';
import 'discover_state.dart';

export 'discover_event.dart';
export 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final AppRouter _appRouter;
  DiscoverBloc({required AppRouter appRouter})
      : _appRouter = appRouter,
        super(DiscoverState(pageController: PageController())) {
    on<SearchPressedEvent>(_onSearchEvent);
    on<CancelPressedEvent>(_onCancelPressedEvent);
  }
  Future<void> _onSearchEvent(
      SearchPressedEvent event, Emitter<DiscoverState> emit) async {
    state.pageController.jumpToPage(1);
    //_appRouter.push(Search.page());
    emit(state);
  }

  Future<void> _onCancelPressedEvent(
      CancelPressedEvent event, Emitter<DiscoverState> emit) async {
    state.pageController.jumpToPage(0);
    emit(state);
  }
}
