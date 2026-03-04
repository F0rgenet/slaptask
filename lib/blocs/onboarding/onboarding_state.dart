part of 'onboarding_bloc.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = _Initial;
  const factory OnboardingState.recording({required int seconds, required double audioLevel}) = _Recording;
  const factory OnboardingState.processing() = _Processing;
  const factory OnboardingState.review({required String transcript, String? error}) = _Review;
  const factory OnboardingState.success() = _Success;
}
