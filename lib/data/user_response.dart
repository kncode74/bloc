class UserResponse {
  final int id;
  final String name;
  final String task;
  final String status;
  final String priority;
  final DateTime dueDate;
  final String notes;
  final List<String> tags;
  final String imageUrl;

  UserResponse({
    required this.id,
    required this.name,
    required this.task,
    required this.status,
    required this.priority,
    required this.dueDate,
    required this.notes,
    required this.tags,
    required this.imageUrl,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      name: json['name'],
      task: json['task'],
      status: json['status'],
      priority: json['priority'],
      dueDate: DateTime.parse(json['dueDate']),
      notes: json['notes'],
      tags: List<String>.from(json['tags']),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'task': task,
      'status': status,
      'priority': priority,
      'dueDate': dueDate.toIso8601String(),
      'notes': notes,
      'tags': tags,
      'imageUrl': imageUrl,
    };
  }
}
