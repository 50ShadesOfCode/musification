import 'package:domain/domain.dart';
import 'package:fpmi_music_band/feature/home/home_navigation_item.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

export 'home_event.dart';
export 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRouter _appRouter;
  HomeBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const HomeState(
          title: 'Discover',
          selectedTab: HomeNavigationItem.DISCOVER,
        )) {
    on<ChangeTab>(_onChangeTab);
  }

  Future<void> _onChangeTab(ChangeTab event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        title: state.title,
        selectedTab: event.tab,
      ),
    );
  }
}
