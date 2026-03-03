part of 'onboarding_bloc.dart';

@freezed
class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.startRecording() = _StartRecording;
  const factory OnboardingEvent.stopRecording() = _StopRecording;
  const factory OnboardingEvent.saveGoals(String goals) = _SaveGoals;
  const factory OnboardingEvent.reset() = _Reset;
  const factory OnboardingEvent.updateAudioLevel() = _UpdateAudioLevel;
  const factory OnboardingEvent.tick() = _Tick;
}