import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class GoalsEditorWidget extends StatefulWidget {
  final String currentGoals;
  final void Function(String) onSave;

  const GoalsEditorWidget({
    super.key,
    required this.currentGoals,
    required this.onSave,
  });

  @override
  State<GoalsEditorWidget> createState() => _GoalsEditorWidgetState();
}

class _GoalsEditorWidgetState extends State<GoalsEditorWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentGoals);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'ЦЕЛИ',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            letterSpacing: 3,
            color: SlapTheme.mutedForeground,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          maxLines: 5,
          style: GoogleFonts.inter(fontSize: 14, color: SlapTheme.foreground, height: 1.5),
          decoration: const InputDecoration(
            hintText: 'Опишите ваши цели...',
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () => widget.onSave(_controller.text.trim()),
            style: ElevatedButton.styleFrom(
              backgroundColor: SlapTheme.secondary,
              foregroundColor: SlapTheme.foreground,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0,
            ),
            child: Text(
              'СОХРАНИТЬ ЦЕЛИ',
              style: GoogleFonts.jetBrainsMono(fontSize: 11, letterSpacing: 2),
            ),
          ),
        ),
      ],
    );
  }
}
