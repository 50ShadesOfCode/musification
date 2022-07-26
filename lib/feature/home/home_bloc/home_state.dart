import 'package:domain/domain.dart';
import 'package:fpmi_music_band/feature/home/home_navigation_item.dart';

class HomeState {
  final String title;
  final HomeNavigationItem selectedTab;
  final Song? playingEntity;

  const HomeState({
    required this.title,
    required this.selectedTab,
    this.playingEntity,
  });

  HomeState copyWith({
    required String title,
    required HomeNavigationItem selectedTab,
    Song? playingEntity,
  }) =>
      HomeState(
        playingEntity: playingEntity,
        title: title,
        selectedTab: selectedTab,
      );
}
