class OnboardingState {
  final int index;

  OnboardingState({required this.index});

  OnboardingState copyWith({
    required int index,
  }) {
    return OnboardingState(index: index);
  }
}
