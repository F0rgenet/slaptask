import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models.dart';
import 'storage_service.dart';

class ApiService {
  static const _chatUrl = 'https://openai.api.proxyapi.ru/v1/chat/completions';
  static const _transcribeUrl = 'https://api.proxyapi.ru/openai/v1/audio/transcriptions';

  static const _modelName = 'gemini/gemini-2.0-flash-exp';

  final String apiKey;

  ApiService(this.apiKey);

  static const _systemPrompt =
      'Ты — SlapTask, жесткий, справедливый и бескомпромиссный ИИ-тренер по дисциплине.\n'
      'Твоя задача — заставить пользователя двигаться к целям, невзирая на оправдания.\n'
      'Проанализируй его цели и историю задач (где [DONE] — успех, [FAILED] — провал).\n'
      '1. Если пользователь часто проваливается: дай задачи чуть проще, но критически важные, чтобы вернуть режим. Будь строг.\n'
      '2. Если пользователь справляется: повышай планку, не давай расслабиться.\n'
      'Сгенерируй ровно 5 конкретных, измеримых задач на сегодня (действия, а не размышления).\n'
      'Формат ответа: ТОЛЬКО 5 строк текста. Без нумерации (1., -), без кавычек, без приветствий и мотивационной воды.';

  static Future<List<String>> generateRawTasks({
    required String apiKey,
    required String goals,
    required List<DayTasks> allHistory,
  }) async {
    final historyStr = _buildHistoryString(allHistory);

    final response = await http.post(
      Uri.parse(_chatUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': _modelName,
        'messages': [
          {'role': 'system', 'content': _systemPrompt},
          {'role': 'user', 'content': 'МОИ ЦЕЛИ:\n$goals\n\nИСТОРИЯ ЗАДАЧ:\n$historyStr'},
        ],
        'temperature': 0.7,
        'max_tokens': 500,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to generate tasks: ${response.statusCode} | ${response.body}');
    }

    final data = jsonDecode(response.body);
    final content = data['choices']?[0]?['message']?['content'] as String? ?? '';

    return content
        .split('\n')
        .map((l) => l.replaceAll(RegExp(r'^\d+[.)]\s*'), '').replaceAll(RegExp(r'^[-*]\s*'), '').trim())
        .where((l) => l.isNotEmpty)
        .take(5)
        .toList();
  }

  static String _buildHistoryString(List<DayTasks> allDays) {
    final recent = allDays.length > 7 ? allDays.sublist(allDays.length - 7) : allDays;
    
    if (recent.isEmpty) return "История пуста (первый день).";

    final buffer = StringBuffer();
    for (final day in recent) {
      buffer.writeln('Дата: ${day.date}');
      for (final task in day.tasks) {
        buffer.writeln('  ${task.completed ? "[DONE]" : "[FAILED]"} ${task.text}');
      }
      buffer.writeln('---');
    }
    return buffer.toString();
  }

  Future<DayTasks> generateTasks(AppState state) async {
    final lines = await generateRawTasks(
      apiKey: apiKey,
      goals: state.goals ?? '',
      allHistory: state.days,
    );

    final today = StorageService.getTodayKey(); 
    
    final tasks = lines.asMap().entries.map((e) => Task(
          id: '$today-${e.key}',
          text: e.value,
          date: today,
        )).toList();

    return DayTasks(date: today, tasks: tasks);
  }

  Future<String> transcribeAudio(String filePath) async {
    final request = http.MultipartRequest('POST', Uri.parse(_transcribeUrl));
    request.headers['Authorization'] = 'Bearer $apiKey';
    request.files.add(await http.MultipartFile.fromPath('file', filePath, filename: 'recording.m4a'));
    request.fields['model'] = 'gpt-4o-transcribe';

    final streamed = await request.send();
    final responseBody = await streamed.stream.bytesToString();

    if (streamed.statusCode != 200) {
      throw Exception('Transcription failed: ${streamed.statusCode}');
    }

    final data = jsonDecode(responseBody);
    return data['text'] as String? ?? '';
  }
}