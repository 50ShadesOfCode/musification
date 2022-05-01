abstract class LaunchRepository {
  const LaunchRepository();

  bool isFirstLaunch();

  Future<void> firstLaunch();
}
