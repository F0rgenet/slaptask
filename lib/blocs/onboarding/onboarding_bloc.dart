import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/repositories/task_repository.dart';
import '../../services/api_service.dart';
import '../../services/audio_service.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';
part 'onboarding_bloc.freezed.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final AudioService _audioService;
  final ApiService _apiService;
  final TaskRepository _repository;

  Timer? _timer;
  Timer? _ampTimer;

  OnboardingBloc(this._audioService, this._apiService, this._repository) : super(const OnboardingState.initial()) {
    on<_StartRecording>(_onStartRecording);
    on<_StopRecording>(_onStopRecording);
    on<_SaveGoals>(_onSaveGoals);
    on<_Reset>(_onReset);
    on<_Tick>(_onTick);
    on<_UpdateAudioLevel>(_onUpdateAudioLevel);
  }

  Future<void> _onStartRecording(_StartRecording event, Emitter<OnboardingState> emit) async {
    final permitted = await _audioService.hasPermission();
    if (!permitted) {
      emit(const OnboardingState.review(transcript: '', error: 'Microphone permission denied'));
      return;
    }

    await _audioService.startRecording();
    emit(const OnboardingState.recording(seconds: 0, audioLevel: 0));

    _timer = Timer.periodic(const Duration(seconds: 1), (_) => add(const OnboardingEvent.tick()));
    _ampTimer = Timer.periodic(const Duration(milliseconds: 100), (_) => add(const OnboardingEvent.updateAudioLevel()));
  }

  void _onTick(_Tick event, Emitter<OnboardingState> emit) {
    if (state is _Recording) {
      final s = state as _Recording;
      emit(s.copyWith(seconds: s.seconds + 1));
    }
  }

  Future<void> _onUpdateAudioLevel(_UpdateAudioLevel event, Emitter<OnboardingState> emit) async {
    if (state is _Recording) {
      final db = await _audioService.getAmplitude();
      final normalized = ((db + 50) / 50).clamp(0.0, 1.0);
      final s = state as _Recording;
      emit(s.copyWith(audioLevel: normalized));
    }
  }

  Future<void> _onStopRecording(_StopRecording event, Emitter<OnboardingState> emit) async {
    _timer?.cancel();
    _ampTimer?.cancel();

    final path = await _audioService.stopRecording();

    if (path == null) {
      emit(const OnboardingState.review(transcript: ''));
      return;
    }

    emit(const OnboardingState.processing());

    try {
      final text = await _apiService.transcribeAudio(path);
      emit(OnboardingState.review(transcript: text));
    } catch (e) {
      emit(const OnboardingState.review(transcript: '', error: 'Transcription failed'));
    }
  }

  Future<void> _onSaveGoals(_SaveGoals event, Emitter<OnboardingState> emit) async {
    final current = _repository.loadState();
    _repository.saveSettingsOnly(current.copyWith(goals: event.goals));
    emit(const OnboardingState.success());
  }

  void _onReset(_Reset event, Emitter<OnboardingState> emit) {
    emit(const OnboardingState.initial());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _ampTimer?.cancel();
    _audioService.dispose();
    return super.close();
  }
}
