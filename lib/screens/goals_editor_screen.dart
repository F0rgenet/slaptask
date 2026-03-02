import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class GoalsEditorScreen extends StatefulWidget {
  final String currentGoals;
  final void Function(String goals) onSave;
  final VoidCallback onBack;

  const GoalsEditorScreen({
    super.key,
    required this.currentGoals,
    required this.onSave,
    required this.onBack,
  });

  @override
  State<GoalsEditorScreen> createState() => _GoalsEditorScreenState();
}

class _GoalsEditorScreenState extends State<GoalsEditorScreen> {
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: GestureDetector(
                onTap: widget.onBack,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_rounded, size: 16, color: SlapTheme.mutedForeground),
                    const SizedBox(width: 8),
                    Text(
                      'BACK',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 10,
                        letterSpacing: 3,
                        color: SlapTheme.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Edit Goals',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w200,
                        letterSpacing: -0.8,
                        color: SlapTheme.foreground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'AI uses these to generate your daily tasks',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 11,
                        color: SlapTheme.mutedForeground,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _controller,
                      maxLines: 10,
                      style: GoogleFonts.inter(fontSize: 14, color: SlapTheme.foreground, height: 1.5),
                      decoration: const InputDecoration(
                        hintText: 'Your goals...',
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _controller.text.trim().isEmpty
                            ? null
                            : () => widget.onSave(_controller.text.trim()),
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
                            const Icon(Icons.save_outlined, size: 16),
                            const SizedBox(width: 12),
                            Text(
                              'SAVE GOALS',
                              style: GoogleFonts.jetBrainsMono(fontSize: 12, letterSpacing: 3, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
