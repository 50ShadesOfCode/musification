import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'launch_repository_test.mocks.dart';

void main() {
  final MockLaunchRepository repo = MockLaunchRepository();
  group('SetFirstLaunchUseCase tests', () {
    test('Check if setFirstLaunch is called', () {
      final NoParams params = NoParams();
      final SetFirstLaunchUseCase usecase =
          SetFirstLaunchUseCase(launchRepository: repo);
      usecase.execute(params);
      verify(repo.setFirstLaunch());
    });
  });
}
