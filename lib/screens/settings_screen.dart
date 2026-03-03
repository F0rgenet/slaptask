import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../blocs/settings/settings_bloc.dart';
import '../blocs/settings/settings_event.dart';
import '../blocs/settings/settings_state.dart';
import '../widgets/goals_editor_widget.dart';
import '../theme.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onResetComplete;

  const SettingsScreen({
    super.key,
    required this.onBack,
    required this.onResetComplete,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        state.maybeWhen(
          dataReset: () => onResetComplete(),
          orElse: () {},
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                child: GestureDetector(
                  onTap: onBack,
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_rounded, size: 16, color: SlapTheme.mutedForeground),
                      const SizedBox(width: 8),
                      Text(
                        'НАЗАД',
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
                  child: BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (goals, freq, tasks, unlimited) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Настройки',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w200,
                                letterSpacing: -0.8,
                                color: SlapTheme.foreground,
                              ),
                            ),
                            const SizedBox(height: 32),

                            // 1. Цели
                            GoalsEditorWidget(
                              currentGoals: goals,
                              onSave: (val) => context.read<SettingsBloc>().add(SettingsEvent.updateGoals(val)),
                            ),
                            const SizedBox(height: 32),
                            const Divider(),
                            const SizedBox(height: 24),

                            // 2. Количество задач
                            _buildSectionTitle('КОЛИЧЕСТВО ЕЖЕДНЕВНЫХ ЗАДАЧ: $tasks'),
                            Slider(
                              value: tasks.toDouble(),
                              min: 1,
                              max: 10,
                              divisions: 9,
                              activeColor: SlapTheme.primary,
                              onChanged: (val) =>
                                  context.read<SettingsBloc>().add(SettingsEvent.updateTaskCount(val.toInt())),
                            ),
                            const SizedBox(height: 24),

                            // 3. Частота
                            _buildSectionTitle('ОБНОВЛЯТЬ ЗАДАЧИ КАЖДЫЕ: $freq ЧАСОВ'),
                            Slider(
                              value: freq.toDouble(),
                              min: 1,
                              max: 48,
                              divisions: 47,
                              activeColor: SlapTheme.primary,
                              onChanged: (val) =>
                                  context.read<SettingsBloc>().add(SettingsEvent.updateFrequency(val.toInt())),
                            ),
                            const SizedBox(height: 24),
                            const Divider(),
                            const SizedBox(height: 24),

                            // 4. Debug Section
                            if (kDebugMode) ...[
                              _buildSectionTitle('DEBUG ОПЦИИ'),
                              SwitchListTile(
                                contentPadding: EdgeInsets.zero,
                                activeColor: SlapTheme.primary,
                                title: Text('Неограниченная перегенерация', style: GoogleFonts.inter(fontSize: 14)),
                                value: unlimited,
                                onChanged: (val) =>
                                    context.read<SettingsBloc>().add(SettingsEvent.toggleUnlimitedRegen(val)),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () =>
                                    context.read<SettingsBloc>().add(const SettingsEvent.spawnTestNotification()),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: SlapTheme.secondary,
                                  foregroundColor: SlapTheme.foreground,
                                ),
                                child: Text('TEST PUSH NOTIFICATION', style: GoogleFonts.jetBrainsMono(fontSize: 10)),
                              ),
                              const SizedBox(height: 24),
                              const Divider(),
                              const SizedBox(height: 24),
                            ],

                            // 5. Сброс данных
                            _buildSectionTitle('ОПАСНАЯ ЗОНА'),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () => _showResetConfirm(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: SlapTheme.destructive.withValues(alpha: 0.1),
                                foregroundColor: SlapTheme.destructive,
                                elevation: 0,
                              ),
                              child: Text('СБРОСИТЬ ВСЕ ДАННЫЕ', style: GoogleFonts.jetBrainsMono(fontSize: 11)),
                            ),
                            const SizedBox(height: 48),
                          ],
                        ),
                        orElse: () => const Center(child: CircularProgressIndicator(color: SlapTheme.primary)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.jetBrainsMono(
        fontSize: 10,
        letterSpacing: 2,
        color: SlapTheme.mutedForeground,
      ),
    );
  }

  void _showResetConfirm(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: SlapTheme.card,
        title: Text('Точно сбросить?', style: GoogleFonts.inter(color: SlapTheme.foreground)),
        content: Text('Это удалит все цели и историю.', style: GoogleFonts.inter(color: SlapTheme.mutedForeground)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('ОТМЕНА', style: GoogleFonts.jetBrainsMono(color: SlapTheme.mutedForeground)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<SettingsBloc>().add(const SettingsEvent.resetData());
            },
            child: Text('УДАЛИТЬ', style: GoogleFonts.jetBrainsMono(color: SlapTheme.destructive)),
          ),
        ],
      ),
    );
  }
}
