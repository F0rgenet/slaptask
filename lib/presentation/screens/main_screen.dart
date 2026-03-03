import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/task/task_bloc.dart';
import '../../services/storage_service.dart';
import '../theme.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/task_history_widget.dart';
import '../widgets/task_list_widget.dart';

class MainScreen extends StatelessWidget {
  final VoidCallback onOpenSettings;

  const MainScreen({super.key, required this.onOpenSettings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: BlocConsumer<TaskBloc, TaskState>(
                listener: (context, state) {
                  state.mapOrNull(
                    loaded: (s) {
                      if (s.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(s.error!), backgroundColor: SlapTheme.destructive),
                        );
                      }
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeMap(
                    loaded: (loaded) {
                      final appState = loaded.appState;
                      final todayKey = StorageService.getTodayKey();
                      final todayTasks = appState.days.where((d) => d.date == todayKey).firstOrNull;
                      final history = appState.days.where((d) => d.date != todayKey).toList()
                        ..sort((a, b) => b.date.compareTo(a.date));

                      final anyChecked = (todayTasks?.completedCount ?? 0) > 0;
                      final canRegenerate = todayTasks != null &&
                          !anyChecked &&
                          (!todayTasks.regenerated || appState.unlimitedRegen);

                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildDateGreeting(),
                            const SizedBox(height: 24),
                            if (todayTasks == null)
                              EmptyStateWidget(
                                isGenerating: loaded.isGenerating,
                                onGenerate: () => context.read<TaskBloc>().add(const TaskEvent.generate()),
                              )
                            else
                              TaskListWidget(
                                dayTasks: todayTasks,
                                isGenerating: loaded.isGenerating,
                                canRegenerate: canRegenerate,
                                onToggle: (id) => context.read<TaskBloc>().add(TaskEvent.toggle(id)),
                                onRegenerate: () => context.read<TaskBloc>().add(const TaskEvent.generate()),
                              ),
                            const SizedBox(height: 32),
                            const Divider(color: SlapTheme.border, height: 1),
                            const SizedBox(height: 8),
                            TaskHistoryWidget(history: history),
                            const SizedBox(height: 24),
                          ],
                        ),
                      );
                    },
                    orElse: () => const Center(child: CircularProgressIndicator(color: SlapTheme.primary)),
                  );
                },
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: SlapTheme.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: Text(
              'СТ',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: SlapTheme.primaryForeground,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'SlapTask',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w200,
              letterSpacing: -0.3,
              color: SlapTheme.foreground,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onOpenSettings,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.settings_outlined, size: 18, color: SlapTheme.mutedForeground),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateGreeting() {
    final now = DateTime.now();
    const weekdays = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье'];
    const months = [
      'января',
      'февраля',
      'марта',
      'апреля',
      'мая',
      'июня',
      'июля',
      'августа',
      'сентября',
      'октября',
      'ноября',
      'декабря'
    ];
    final dateStr = '${weekdays[now.weekday - 1]}, ${now.day} ${months[now.month - 1]}';

    final hour = now.hour;
    final greeting = hour < 12
        ? 'Доброе утро'
        : hour < 17
            ? 'Добрый день'
            : 'Добрый вечер';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateStr.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            letterSpacing: 3,
            color: SlapTheme.mutedForeground,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$greeting. За работу.',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w200,
            letterSpacing: -0.8,
            color: SlapTheme.foreground,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: SlapTheme.border)),
      ),
      child: Text(
        'SLAPTASK \u2014 НИКАКИХ ОПРАВДАНИЙ',
        textAlign: TextAlign.center,
        style: GoogleFonts.jetBrainsMono(
          fontSize: 9,
          letterSpacing: 3,
          color: SlapTheme.mutedForeground.withValues(alpha: 0.3),
        ),
      ),
    );
  }
}