import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/task.dart';
import '../theme.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  const TaskItemWidget({super.key, required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: task.completed ? SlapTheme.secondary.withValues(alpha: 0.3) : SlapTheme.secondary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: task.completed ? SlapTheme.border.withValues(alpha: 0.5) : SlapTheme.border,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: task.completed
                  ? Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: SlapTheme.success,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.check_rounded, size: 12, color: SlapTheme.successForeground),
                    )
                  : Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: SlapTheme.mutedForeground, width: 1.5),
                      ),
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                task.text,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  height: 1.5,
                  color: task.completed ? SlapTheme.mutedForeground : SlapTheme.foreground,
                  decoration: task.completed ? TextDecoration.lineThrough : null,
                  decorationColor: SlapTheme.mutedForeground.withValues(alpha: 0.3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
