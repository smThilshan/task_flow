class TaskModel {
  final int? id;
  final String title;
  final String description;
  final DateTime dueDate;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
  });

  // Convert TaskModel to Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
    };
  }

  // Create TaskModel from Map for SQLite retrieval
  static TaskModel fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: DateTime.parse(map['dueDate']),
    );
  }
}
