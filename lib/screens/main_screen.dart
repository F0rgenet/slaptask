import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import '../theme.dart';
import '../models.dart';
import '../services/storage_service.dart';
import '../services/api_service.dart';
import '../widgets/task_item.dart';
import '../widgets/task_history.dart';

var logger = Logger();

class MainScreen extends StatefulWidget {
  final AppState state;
  final String apiKey;
  final void Function(AppState) onStateChanged;
  final VoidCallback onEditGoals;

  const MainScreen({
    super.key,
    required this.state,
    required this.apiKey,
    required this.onStateChanged,
    required this.onEditGoals,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isGenerating = false;
  String? _error;

  DayTasks? get _todayTasks => StorageService.getTodayTasks(widget.state);
  List<DayTasks> get _history => StorageService.getHistoryDays(widget.state);
  int get _completedCount => _todayTasks?.tasks.where((t) => t.completed).length ?? 0;
  int get _totalCount => _todayTasks?.tasks.length ?? 0;
  bool get _anyChecked => _completedCount > 0;
  bool get _canRegenerate => _todayTasks != null && !_todayTasks!.regenerated && !_anyChecked;

  void _toggleTask(String id) {
    final todayKey = StorageService.getTodayKey();
    final updated = AppState(
      goals: widget.state.goals,
      days: widget.state.days.map((day) {
        if (day.date != todayKey) return day;
        return DayTasks(
          date: day.date,
          tasks: day.tasks.map((t) => t.id == id ? (Task(id: t.id, text: t.text, completed: !t.completed, date: t.date)) : t).toList(),
          regenerated: day.regenerated,
        );
      }).toList(),
    );
    widget.onStateChanged(updated);
    StorageService.save(updated);
  }

  Future<void> _handleGenerate() async {
    setState(() {
      _isGenerating = true;
      _error = null;
    });

    try {
      final api = ApiService(widget.apiKey);
      final newDay = await api.generateTasks(widget.state);
      final todayKey = StorageService.getTodayKey();
      final existingIndex = widget.state.days.indexWhere((d) => d.date == todayKey);

      List<DayTasks> updatedDays;
      if (existingIndex >= 0) {
        updatedDays = List.from(widget.state.days);
        updatedDays[existingIndex] = DayTasks(date: newDay.date, tasks: newDay.tasks, regenerated: true);
      } else {
        updatedDays = [...widget.state.days, newDay];
      }

      final updated = AppState(goals: widget.state.goals, days: updatedDays);
      widget.onStateChanged(updated);
      await StorageService.save(updated);
    } catch (error) {
      setState(() => _error = 'Ошибка генерации задач. Попробуйте ещё раз.');
      logger.t(error);
    } finally {
      setState(() => _isGenerating = false);
    }
  }

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Доброе утро';
    if (hour < 17) return 'Добрый день';
    return 'Добрый вечер';
  }

  String get _dateStr {
    final now = DateTime.now();
    const weekdays = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье'];
    const months = ['января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря'];
    return '${weekdays[now.weekday - 1]}, ${now.day} ${months[now.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildDateGreeting(),
                    const SizedBox(height: 24),
                    if (_todayTasks == null) _buildEmpty() else _buildTasks(),
                    if (_error != null) _buildError(),
                    const SizedBox(height: 32),
                    const Divider(color: SlapTheme.border, height: 1),
                    const SizedBox(height: 8),
                    TaskHistoryWidget(history: _history),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
            onTap: widget.onEditGoals,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.tune_rounded, size: 18, color: SlapTheme.mutedForeground),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _dateStr.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            letterSpacing: 3,
            color: SlapTheme.mutedForeground,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$_greeting. За работу.',
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

  Widget _buildEmpty() {
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
          Text(
            'На сегодня задач пока нет',
            style: GoogleFonts.inter(fontSize: 14, color: SlapTheme.foreground),
          ),
          const SizedBox(height: 8),
          Text(
            'Создайте список задач на день или\nдождитесь автогенерации в 10:00',
            textAlign: TextAlign.center,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              color: SlapTheme.mutedForeground,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: _isGenerating ? null : _handleGenerate,
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
                  _isGenerating
                      ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: SlapTheme.primaryForeground))
                      : const Icon(Icons.flash_on_rounded, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    _isGenerating ? 'ГЕНЕРАЦИЯ...' : 'СОЗДАТЬ ЗАДАЧИ',
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

  Widget _buildTasks() {
    final todayTasks = _todayTasks!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(Icons.my_location_rounded, size: 16, color: SlapTheme.primary),
            const SizedBox(width: 12),
            Text(
              'СЕГОДНЯ',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 10,
                letterSpacing: 3,
                color: SlapTheme.mutedForeground,
              ),
            ),
            const Spacer(),
            Text(
              '$_completedCount/$_totalCount',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 11,
                color: _completedCount == _totalCount && _totalCount > 0 ? SlapTheme.success : SlapTheme.mutedForeground,
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 80,
              height: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: _totalCount > 0 ? _completedCount / _totalCount : 0,
                  backgroundColor: SlapTheme.secondary,
                  color: _completedCount == _totalCount && _totalCount > 0 ? SlapTheme.success : SlapTheme.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...todayTasks.tasks.map((task) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TaskItemWidget(
                task: task,
                onToggle: () => _toggleTask(task.id),
              ),
            )),
        if (_completedCount == _totalCount && _totalCount > 0)
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
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 12,
                    letterSpacing: 3,
                    color: SlapTheme.success,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Неплохо. Повтори это завтра.',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: SlapTheme.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
        if (_canRegenerate)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: OutlinedButton(
              onPressed: _isGenerating ? null : _handleGenerate,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: SlapTheme.border),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _isGenerating
                      ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 1.5, color: SlapTheme.mutedForeground))
                      : const Icon(Icons.refresh_rounded, size: 14, color: SlapTheme.mutedForeground),
                  const SizedBox(width: 8),
                  Text(
                    _isGenerating ? 'ПЕРЕГЕНЕРАЦИЯ...' : 'ЭТО МУСОР, ПЕРЕГЕНЕРИРУЙ',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      letterSpacing: 2,
                      color: SlapTheme.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (todayTasks.regenerated && !_canRegenerate && _anyChecked)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Center(
              child: Text(
                'регенерация на сегодня использована',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 9,
                  color: SlapTheme.mutedForeground.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildError() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: SlapTheme.destructive.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: SlapTheme.destructive.withValues(alpha: 0.2)),
      ),
      child: Text(
        _error!,
        style: GoogleFonts.jetBrainsMono(fontSize: 11, color: SlapTheme.destructive),
      ),
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