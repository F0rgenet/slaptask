import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/onboarding/onboarding_bloc.dart';
import '../../data/repositories/task_repository.dart';
import '../../services/api_service.dart';
import '../../services/audio_service.dart';
import '../theme.dart';

class OnboardingScreen extends StatelessWidget {
  final VoidCallback onFinish;

  const OnboardingScreen({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(
        context.read<AudioService>(),
        context.read<ApiService>(),
        context.read<TaskRepository>(),
      ),
      child: _OnboardingContent(onFinish: onFinish),
    );
  }
}

class _OnboardingContent extends StatefulWidget {
  final VoidCallback onFinish;
  const _OnboardingContent({required this.onFinish});

  @override
  State<_OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<_OnboardingContent> with SingleTickerProviderStateMixin {
  final _editController = TextEditingController();
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _editController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        state.mapOrNull(
          review: (s) {
            if (s.transcript.isNotEmpty) _editController.text = s.transcript;
          },
          success: (_) => widget.onFinish(),
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildHeader(state),
                      const SizedBox(height: 48),
                      state.maybeMap(
                        initial: (_) => _buildIntro(context),
                        recording: (s) => _buildRecording(context, s.seconds, s.audioLevel),
                        processing: (_) => const Center(child: CircularProgressIndicator(color: SlapTheme.primary)),
                        review: (s) => _buildReview(context, s.transcript),
                        orElse: () => const SizedBox.shrink(),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'НИКАКИХ ОПРАВДАНИЙ. НИКАКОЙ ПОЩАДЫ.',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 9,
                          letterSpacing: 3,
                          color: SlapTheme.mutedForeground.withValues(alpha: 0.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(OnboardingState state) {
    final showSub = state.maybeMap(initial: (_) => true, orElse: () => false);
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: SlapTheme.primary,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Text(
                'СТ',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: SlapTheme.primaryForeground,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'SlapTask',
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.w200,
                letterSpacing: -1.0,
                color: SlapTheme.foreground,
              ),
            ),
          ],
        ),
        if (showSub) ...[
          const SizedBox(height: 16),
          Text(
            'Запиши свои цели. ИИ будет каждый день создавать для тебя 5 жестких задач. Никаких оправданий.',
            textAlign: TextAlign.center,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 12,
              color: SlapTheme.mutedForeground,
              height: 1.6,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildIntro(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.read<OnboardingBloc>().add(const OnboardingEvent.startRecording()),
          child: Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: SlapTheme.secondary,
              border: Border.all(color: SlapTheme.border),
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.mic_outlined, size: 40, color: SlapTheme.mutedForeground),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'НАЖМИ ДЛЯ ЗАПИСИ',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            letterSpacing: 3,
            color: SlapTheme.mutedForeground,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'ИЛИ ВВЕДИ ВРУЧНУЮ',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            letterSpacing: 2,
            color: SlapTheme.mutedForeground,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => context.read<OnboardingBloc>().add(const OnboardingEvent.stopRecording()),
          child: Text(
            'перейти к вводу текста',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              color: SlapTheme.primary,
              decoration: TextDecoration.underline,
              decorationColor: SlapTheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecording(BuildContext context, int seconds, double audioLevel) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');

    return Column(
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, _) => Transform.scale(
                  scale: 1 + audioLevel * 0.6,
                  child: Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: SlapTheme.primary.withValues(alpha: 0.1 + audioLevel * 0.15),
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, _) => Transform.scale(
                  scale: 1 + audioLevel * 0.3,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: SlapTheme.primary.withValues(alpha: 0.15),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.read<OnboardingBloc>().add(const OnboardingEvent.stopRecording()),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: SlapTheme.primary,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.stop_rounded, size: 28, color: SlapTheme.primaryForeground),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '$m:$s',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 24,
            color: SlapTheme.foreground,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: SlapTheme.primary,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'ИДЕТ ЗАПИСЬ',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 10,
                letterSpacing: 3,
                color: SlapTheme.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(24, (i) {
              final h = max(4.0, audioLevel * 32 * sin(i * 0.5 + DateTime.now().millisecondsSinceEpoch * 0.003));
              return Container(
                width: 2,
                height: h,
                margin: const EdgeInsets.symmetric(horizontal: 1),
                decoration: BoxDecoration(
                  color: SlapTheme.primary.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildReview(BuildContext context, String transcript) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'ТВОИ ЦЕЛИ',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            letterSpacing: 3,
            color: SlapTheme.mutedForeground,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _editController,
          maxLines: 7,
          style: GoogleFonts.inter(fontSize: 14, color: SlapTheme.foreground, height: 1.5),
          decoration: const InputDecoration(
            hintText:
                'Я хочу выучить немецкий, тренироваться 4 раза в неделю, закончить пет-проект, читать 2 книги в месяц...',
          ),
        ),
        if (transcript.isNotEmpty) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: SlapTheme.secondary.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: SlapTheme.border.withValues(alpha: 0.5)),
            ),
            child: Row(
              children: [
                const Icon(Icons.graphic_eq_rounded, size: 14, color: SlapTheme.mutedForeground),
                const SizedBox(width: 8),
                Text(
                  'расшифровано из голоса',
                  style: GoogleFonts.jetBrainsMono(fontSize: 10, color: SlapTheme.mutedForeground),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 24),
        SizedBox(
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              if (_editController.text.trim().isNotEmpty) {
                context.read<OnboardingBloc>().add(OnboardingEvent.saveGoals(_editController.text.trim()));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: SlapTheme.primary,
              foregroundColor: SlapTheme.primaryForeground,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'В ДЕЛО',
                  style: GoogleFonts.jetBrainsMono(fontSize: 12, letterSpacing: 3, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.arrow_forward_rounded, size: 16),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: GestureDetector(
            onTap: () {
               _editController.clear();
               context.read<OnboardingBloc>().add(const OnboardingEvent.reset());
            },
            child: Text(
              'перезаписать',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                color: SlapTheme.mutedForeground,
              ),
            ),
          ),
        ),
      ],
    );
  }
}