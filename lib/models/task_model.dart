

import 'dart:convert';


Task oneTaskFromJson(String str) => Task.fromJson(json.decode(str));

String oneTaskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
    this.id,
    this.name,
    this.description,
    this.deadline,
    this.statusId,
    this.sprintId,
    this.priority,
    this.deadlineNotified,
    this.almostDeadlineNotified,
    this.userId,
  });

  int? id;
  String? name;
  String? description;
  DateTime? deadline;
  int? statusId;
  int? sprintId;
  String? priority;
  bool? deadlineNotified;
  bool? almostDeadlineNotified;
  int? userId;


  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    deadline: DateTime.parse(json["deadline"]),
    statusId: json["status_id"],
    sprintId: json["sprint_id"],
    priority: json["priority"],
    deadlineNotified: json["deadline_notified"],
    almostDeadlineNotified: json["almost_deadline_notified"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    //"deadline": "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
    "status_id": statusId,
    "sprint_id": sprintId,
    "priority": priority,
    "deadline_notified": deadlineNotified,
    "almost_deadline_notified": almostDeadlineNotified,
    "user_id": userId,
  };
}