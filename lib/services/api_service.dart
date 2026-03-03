import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../data/models/task.dart';
import '../data/models/day_tasks.dart';
import 'storage_service.dart';

class ApiService {
  static const _baseUrl = 'https://api.proxyapi.ru/google/v1beta/models/gemini-3-flash-preview:generateContent';
  static const _transcribeUrl = 'https://api.proxyapi.ru/openai/v1/audio/transcriptions';
  static const _modelName = 'gemini/gemini-3-flash-preview';

  final String apiKey;

  ApiService(this.apiKey);

  Future<DayTasks> generateDayTasks(String goals, List<DayTasks> history, int count) async {
    final recentHistory = history.take(7).toList();
    final historyStr = _buildHistoryString(recentHistory);

    final systemPrompt = '''
Ты — SlapTask, жесткий и справедливый ИИ-тренер дисциплины.
Анализируй цели и историю выполнения задач.
Если провалов много — упростить, но оставить критично важные действия.
Если успехов много — повышать планку.
Никакой воды. Только конкретные измеримые действия.
''';

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $apiKey'},
      body: jsonEncode({
        "model": _modelName,
        "contents": [
          {
            "parts": [
              {"text": "$systemPrompt\n\nЦЕЛИ:\n$goals\n\nИСТОРИЯ:\n$historyStr"},
            ],
          },
        ],
        "generationConfig": {
          "responseMimeType": "application/json",
          "responseJsonSchema": {
            "type": "object",
            "properties": {
              "tasks": {
                "type": "array",
                "items": {"type": "string"},
                "minItems": count,
                "maxItems": count,
              },
            },
            "required": ["tasks"],
          },
        },
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Gemini API Error: ${response.statusCode} ${response.body}');
    }

    final tasks = await compute(_parseTasks, response.body);

    final today = StorageService.getTodayKey();

    final taskModels = tasks.asMap().entries.map((e) {
      return Task(id: '$today-${e.key}', text: e.value, date: today);
    }).toList();

    return DayTasks(date: today, tasks: taskModels);
  }

  static List<String> _parseTasks(String responseBody) {
    final data = jsonDecode(responseBody);

    final text = data['candidates']?[0]?['content']?['parts']?[0]?['text'];

    if (text == null) return [];

    final parsed = jsonDecode(text);
    final tasks = parsed['tasks'] as List<dynamic>? ?? [];

    return tasks.map((e) => e.toString().trim()).toList();
  }

  String _buildHistoryString(List<DayTasks> days) {
    if (days.isEmpty) return "История пуста.";

    final buffer = StringBuffer();

    for (final day in days) {
      buffer.writeln('Дата: ${day.date}');
      for (final task in day.tasks) {
        buffer.writeln('${task.completed ? "[DONE]" : "[FAILED]"} ${task.text}');
      }
      buffer.writeln('---');
    }

    return buffer.toString();
  }

  Future<String> transcribeAudio(String filePath) async {
    final request = http.MultipartRequest('POST', Uri.parse(_transcribeUrl));
    request.headers['Authorization'] = 'Bearer $apiKey';
    request.files.add(await http.MultipartFile.fromPath('file', filePath));
    request.fields['model'] = 'gpt-4o-transcribe';

    final streamed = await request.send();
    final responseBody = await streamed.stream.bytesToString();

    if (streamed.statusCode != 200) throw Exception('Transcribe failed');

    return await compute(_parseTranscribeResponse, responseBody);
  }

  static String _parseTranscribeResponse(String responseBody) {
    final data = jsonDecode(responseBody);
    return data['text'] as String? ?? '';
  }
}
