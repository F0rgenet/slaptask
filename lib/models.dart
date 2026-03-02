class Task {
  final String id;
  final String text;
  bool completed;
  final String date;

  Task({
    required this.id,
    required this.text,
    this.completed = false,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'completed': completed,
        'date': date,
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as String,
        text: json['text'] as String,
        completed: json['completed'] as bool? ?? false,
        date: json['date'] as String,
      );
}

class DayTasks {
  final String date;
  final List<Task> tasks;
  bool regenerated;

  DayTasks({
    required this.date,
    required this.tasks,
    this.regenerated = false,
  });

  int get completedCount => tasks.where((t) => t.completed).length;

  Map<String, dynamic> toJson() => {
        'date': date,
        'tasks': tasks.map((t) => t.toJson()).toList(),
        'regenerated': regenerated,
      };

  factory DayTasks.fromJson(Map<String, dynamic> json) => DayTasks(
        date: json['date'] as String,
        tasks: (json['tasks'] as List).map((t) => Task.fromJson(t)).toList(),
        regenerated: json['regenerated'] as bool? ?? false,
      );
}

class AppState {
  String? goals;
  List<DayTasks> days;

  AppState({this.goals, List<DayTasks>? days}) : days = days ?? [];

  Map<String, dynamic> toJson() => {
        'goals': goals,
        'days': days.map((d) => d.toJson()).toList(),
      };

  factory AppState.fromJson(Map<String, dynamic> json) => AppState(
        goals: json['goals'] as String?,
        days: (json['days'] as List?)?.map((d) => DayTasks.fromJson(d)).toList() ?? [],
      );
}
