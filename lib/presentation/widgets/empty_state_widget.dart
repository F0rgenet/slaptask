import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class EmptyStateWidget extends StatelessWidget {
  final bool isGenerating;
  final VoidCallback onGenerate;

  const EmptyStateWidget({super.key, required this.isGenerating, required this.onGenerate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: SlapTheme.secondary,
              border: Border.all(color: SlapTheme.border),
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.flash_on_rounded, size: 28, color: SlapTheme.mutedForeground),
          ),
          const SizedBox(height: 24),
          Text('На сегодня задач пока нет', style: GoogleFonts.inter(fontSize: 14, color: SlapTheme.foreground)),
          const SizedBox(height: 8),
          Text(
            'Создайте список задач на день или\nдождитесь автогенерации в 10:00',
            textAlign: TextAlign.center,
            style: GoogleFonts.jetBrainsMono(fontSize: 11, color: SlapTheme.mutedForeground, height: 1.5),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: isGenerating ? null : onGenerate,
              style: ElevatedButton.styleFrom(
                backgroundColor: SlapTheme.primary,
                foregroundColor: SlapTheme.primaryForeground,
                disabledBackgroundColor: SlapTheme.primary.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isGenerating
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: SlapTheme.primaryForeground),
                        )
                      : const Icon(Icons.flash_on_rounded, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    isGenerating ? 'ГЕНЕРАЦИЯ...' : 'СОЗДАТЬ ЗАДАЧИ',
                    style: GoogleFonts.jetBrainsMono(fontSize: 11, letterSpacing: 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
