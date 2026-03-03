import 'dart:async';
import 'dart:io' show Platform;
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../theme.dart';
import '../services/api_service.dart';

var logger = Logger();

class OnboardingScreen extends StatefulWidget {
  final String apiKey;
  final void Function(String goals) onGoalsSaved;

  const OnboardingScreen({
    super.key,
    required this.apiKey,
    required this.onGoalsSaved,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with TickerProviderStateMixin {
  String _phase = 'intro';
  bool _isRecording = false;
  int _seconds = 0;
  double _audioLevel = 0;
  String _transcript = '';
  final _editController = TextEditingController();
  Timer? _timer;
  Timer? _levelTimer;
  final _recorder = AudioRecorder();
  String? _recordingPath;
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
    _timer?.cancel();
    _levelTimer?.cancel();
    _recorder.dispose();
    _editController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (!kIsWeb && !Platform.isLinux) {
      final status = await Permission.microphone.request();
      if (!status.isGranted) {
        setState(() {
          _transcript = '';
          _editController.text = '';
          _phase = 'review';
        });
        return;
      }
    }

    final dir = await getApplicationDocumentsDirectory();
    _recordingPath = '${dir.path}/recording.m4a';

    await _recorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc, bitRate: 128000),
      path: _recordingPath!,
    );

    setState(() {
      _isRecording = true;
      _phase = 'recording';
      _seconds = 0;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _seconds++);
    });

    _levelTimer = Timer.periodic(const Duration(milliseconds: 100), (_) async {
      final amplitude = await _recorder.getAmplitude();
      final db = amplitude.current;
      final normalized = ((db + 50) / 50).clamp(0.0, 1.0);
      if (mounted) setState(() => _audioLevel = normalized);
    });
  }

  Future<void> _stopRecording() async {
    _timer?.cancel();
    _levelTimer?.cancel();
    final path = await _recorder.stop();

    setState(() {
      _isRecording = false;
      _audioLevel = 0;
    });

    if (path != null) {
      await _transcribeAudio(path);
    } else {
      setState(() => _phase = 'review');
    }
  }

  Future<void> _transcribeAudio(String path) async {
    try {
      final api = ApiService(widget.apiKey);
      final text = await api.transcribeAudio(path);
      setState(() {
        _transcript = text;
        _editController.text = text;
        _phase = 'review';
      });
    } catch (error) {
      setState(() {
        _transcript = '';
        _editController.text = '';
        _phase = 'review';
      });
      logger.t(error);
    }
  }

  String _formatTime(int s) {
    final m = (s ~/ 60).toString().padLeft(2, '0');
    final sec = (s % 60).toString().padLeft(2, '0');
    return '$m:$sec';
  }

  @override
  Widget build(BuildContext context) {
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
                  _buildHeader(),
                  const SizedBox(height: 48),
                  if (_phase == 'intro') _buildIntro(),
                  if (_phase == 'recording') _buildRecording(),
                  if (_phase == 'review') _buildReview(),
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
  }

  Widget _buildHeader() {
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
        if (_phase == 'intro') ...[
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

  Widget _buildIntro() {
    return Column(
      children: [
        GestureDetector(
          onTap: _startRecording,
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
          onTap: () => setState(() {
            _transcript = '';
            _editController.text = '';
            _phase = 'review';
          }),
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

  Widget _buildRecording() {
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
                builder: (_, __) => Transform.scale(
                  scale: 1 + _audioLevel * 0.6,
                  child: Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: SlapTheme.primary.withValues(alpha: 0.1 + _audioLevel * 0.15),
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _pulseController,
                builder: (_, __) => Transform.scale(
                  scale: 1 + _audioLevel * 0.3,
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
                onTap: _stopRecording,
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
          _formatTime(_seconds),
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
        if (_isRecording)
          SizedBox(
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(24, (i) {
                final h = max(4.0, _audioLevel * 32 * sin(i * 0.5 + DateTime.now().millisecondsSinceEpoch * 0.003));
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

  Widget _buildReview() {
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
        if (_transcript.isNotEmpty) ...[
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
            onPressed:
                _editController.text.trim().isEmpty ? null : () => widget.onGoalsSaved(_editController.text.trim()),
            style: ElevatedButton.styleFrom(
              backgroundColor: SlapTheme.primary,
              foregroundColor: SlapTheme.primaryForeground,
              disabledBackgroundColor: SlapTheme.primary.withValues(alpha: 0.3),
              disabledForegroundColor: SlapTheme.primaryForeground.withValues(alpha: 0.3),
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
            onTap: () => setState(() {
              _phase = 'intro';
              _transcript = '';
              _editController.clear();
            }),
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
