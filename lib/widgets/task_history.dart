import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../models.dart';

class TaskHistoryWidget extends StatefulWidget {
  final List<DayTasks> history;

  const TaskHistoryWidget({super.key, required this.history});

  @override
  State<TaskHistoryWidget> createState() => _TaskHistoryWidgetState();
}

class _TaskHistoryWidgetState extends State<TaskHistoryWidget> {
  bool _isOpen = false;
  final Set<String> _expandedDays = {};

  String _formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    
    if (date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day) {
      return 'Вчера';
    }
    
    const weekdays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    const months = ['янв', 'фев', 'мар', 'апр', 'мая', 'июн', 'июл', 'авг', 'сен', 'окт', 'ноя', 'дек'];
    
    return '${weekdays[date.weekday - 1]}, ${date.day} ${months[date.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    if (widget.history.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () => setState(() => _isOpen = !_isOpen),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Icon(
                  _isOpen ? Icons.keyboard_arrow_down_rounded : Icons.chevron_right_rounded,
                  size: 14,
                  color: SlapTheme.mutedForeground,
                ),
                const SizedBox(width: 8),
                Text(
                  'ИСТОРИЯ',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 10,
                    letterSpacing: 3,
                    color: SlapTheme.mutedForeground,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '${widget.history.length}д',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 10,
                    color: SlapTheme.mutedForeground.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isOpen)
          ...widget.history.map((day) {
            final completed = day.completedCount;
            final total = day.tasks.length;
            final isExpanded = _expandedDays.contains(day.date);

            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: SlapTheme.border),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      if (isExpanded) {
                        _expandedDays.remove(day.date);
                      } else {
                        _expandedDays.add(day.date);
                      }
                    }),
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          Icon(
                            isExpanded ? Icons.keyboard_arrow_down_rounded : Icons.chevron_right_rounded,
                            size: 12,
                            color: SlapTheme.mutedForeground,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _formatDate(day.date),
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: SlapTheme.foreground,
                              ),
                            ),
                          ),
                          Text(
                            '$completed/$total',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 11,
                              color: completed == total ? SlapTheme.success : SlapTheme.mutedForeground,
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 64,
                            height: 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: total > 0 ? completed / total : 0,
                                backgroundColor: SlapTheme.secondary,
                                color: completed == total ? SlapTheme.success : SlapTheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isExpanded)
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(top: BorderSide(color: SlapTheme.border)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        children: day.tasks.map((task) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: task.completed
                                    ? Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: SlapTheme.success.withValues(alpha: 0.2),
                                        ),
                                        alignment: Alignment.center,
                                        child: const Icon(Icons.check_rounded, size: 10, color: SlapTheme.success),
                                      )
                                    : Icon(Icons.circle_outlined, size: 16, color: SlapTheme.destructive.withValues(alpha: 0.5)),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  task.text,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    height: 1.5,
                                    color: SlapTheme.mutedForeground,
                                    decoration: task.completed ? TextDecoration.lineThrough : null,
                                    decorationColor: SlapTheme.mutedForeground.withValues(alpha: 0.3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )).toList(),
                      ),
                    ),
                ],
              ),
            );
          }),
      ],
    );
  }
}