import 'package:domain/domain.dart';

class FirstLaunchUseCase extends UseCase<void, NoParams> {
  final LaunchRepository _launchRepository;

  FirstLaunchUseCase({
    required LaunchRepository launchRepository,
  }) : _launchRepository = launchRepository;

  @override
  Future<void> execute(NoParams params) {
    return _launchRepository.firstLaunch();
  }
}
