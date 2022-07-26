import 'package:domain/domain.dart';
import 'package:fpmi_music_band/feature/home/home_navigation_item.dart';

class HomeState {
  final String title;
  final HomeNavigationItem selectedTab;

  const HomeState({
    required this.title,
    required this.selectedTab,
  });

  HomeState copyWith({
    required String title,
    required HomeNavigationItem selectedTab,
  }) =>
      HomeState(
        title: title,
        selectedTab: selectedTab,
      );
}
