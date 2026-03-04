import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../../data/models/day_tasks.dart';
import 'task_item_widget.dart';

class TaskListWidget extends StatelessWidget {
  final DayTasks dayTasks;
  final Function(String) onToggle;
  final VoidCallback onRegenerate;
  final bool isGenerating;
  final bool canRegenerate;

  const TaskListWidget({
    super.key,
    required this.dayTasks,
    required this.onToggle,
    required this.onRegenerate,
    required this.isGenerating,
    required this.canRegenerate,
  });

  @override
  Widget build(BuildContext context) {
    final completedCount = dayTasks.completedCount;
    final totalCount = dayTasks.tasks.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(Icons.my_location_rounded, size: 16, color: SlapTheme.primary),
            const SizedBox(width: 12),
            Text(
              'СЕГОДНЯ',
              style: GoogleFonts.jetBrainsMono(fontSize: 10, letterSpacing: 3, color: SlapTheme.mutedForeground),
            ),
            const Spacer(),
            Text(
              '$completedCount/$totalCount',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                color: completedCount == totalCount && totalCount > 0 ? SlapTheme.success : SlapTheme.mutedForeground,
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 80,
              height: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: totalCount > 0 ? completedCount / totalCount : 0,
                  backgroundColor: SlapTheme.secondary,
                  color: completedCount == totalCount && totalCount > 0 ? SlapTheme.success : SlapTheme.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...dayTasks.tasks.map(
          (task) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TaskItemWidget(task: task, onToggle: () => onToggle(task.id)),
          ),
        ),
        if (completedCount == totalCount && totalCount > 0)
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: SlapTheme.success.withValues(alpha: 0.2)),
              color: SlapTheme.success.withValues(alpha: 0.05),
            ),
            child: Column(
              children: [
                Text(
                  'ГОТОВО',
                  style: GoogleFonts.jetBrainsMono(fontSize: 12, letterSpacing: 3, color: SlapTheme.success),
                ),
                const SizedBox(height: 4),
                Text(
                  'Неплохо. Повтори это завтра.',
                  style: GoogleFonts.inter(fontSize: 12, color: SlapTheme.mutedForeground),
                ),
              ],
            ),
          ),
        if (canRegenerate)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: OutlinedButton(
              onPressed: isGenerating ? null : onRegenerate,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: SlapTheme.border),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isGenerating
                      ? const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(strokeWidth: 1.5, color: SlapTheme.mutedForeground),
                        )
                      : const Icon(Icons.refresh_rounded, size: 14, color: SlapTheme.mutedForeground),
                  const SizedBox(width: 8),
                  Text(
                    isGenerating ? 'ПЕРЕГЕНЕРАЦИЯ...' : 'ЭТО МУСОР, ПЕРЕГЕНЕРИРУЙ',
                    style: GoogleFonts.jetBrainsMono(fontSize: 10, letterSpacing: 2, color: SlapTheme.mutedForeground),
                  ),
                ],
              ),
            ),
          ),
        if (dayTasks.regenerated && !canRegenerate && completedCount > 0)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Center(
              child: Text(
                'регенерация на сегодня использована',
                style: GoogleFonts.jetBrainsMono(fontSize: 9, color: SlapTheme.mutedForeground.withValues(alpha: 0.5)),
              ),
            ),
          ),
      ],
    );
  }
}
