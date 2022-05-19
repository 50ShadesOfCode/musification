import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'launch_repository_test.mocks.dart';

void main() {
  final IsFirstLaunchUseCase useCase = IsFirstLaunchUseCase(
    launchRepository: MockLaunchRepository(),
  );
  group('IsFirstLaunchUseCase', () {
    test('verify first launch true', () {
      const bool expectedValue = true;
      when(useCase.execute(NoParams())).thenReturn(true);
      final bool actualValue = useCase.execute(NoParams());
      expect(actualValue, expectedValue);
    });
  });
}
