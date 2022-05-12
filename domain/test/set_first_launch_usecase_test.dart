import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'launch_repository_test.mocks.dart';

void main() {
  final MockLaunchRepository repo = MockLaunchRepository();
  final SetFirstLaunchUseCase useCase =
      SetFirstLaunchUseCase(launchRepository: repo);
  group('SetFirstLaunchUseCase tests', () {
    test('verify setFirstLaunch called once', () {
      final NoParams params = NoParams();
      useCase.execute(params);
      verify(repo.setFirstLaunch()).called(1);
    });
  });
}
