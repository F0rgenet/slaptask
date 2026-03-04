import 'package:flutter_test/flutter_test.dart';
import 'package:slaptask/data/models/day_tasks.dart';
import 'package:slaptask/data/models/task.dart';

void main() {
  group('DayTasks Model', () {
    test('completedCount returns correct number of finished tasks', () {
      final tasks = [
        Task(id: '1', text: 'Task 1', date: '2026-03-04', completed: true),
        Task(id: '2', text: 'Task 2', date: '2026-03-04', completed: false),
        Task(id: '3', text: 'Task 3', date: '2026-03-04', completed: true),
      ];
      final day = DayTasks(date: '2026-03-04', tasks: tasks);
      expect(day.completedCount, 2);
    });

    test('completedCount returns 0 for empty list', () {
      final day = DayTasks(date: '2026-03-04', tasks: []);
      expect(day.completedCount, 0);
    });
  });
}
