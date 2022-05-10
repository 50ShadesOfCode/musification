import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'launch_repository_test.mocks.dart';

void main() {
  group('IsFirstLaunchUseCase', () {
    test('The base value of firstLaunch should be true', () {
      const bool expectedValue = true;
      final IsFirstLaunchUseCase usecase = IsFirstLaunchUseCase(
        launchRepository: MockLaunchRepository(),
      );
      when(usecase.execute(NoParams())).thenReturn(true);
      final bool actualValue = usecase.execute(NoParams());
      expect(actualValue, expectedValue);
    });
  });
}
