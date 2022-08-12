

import 'dart:convert';
import 'package:plane_vite/models/project_user_model.dart';
import 'dart:io';

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
    this.isloading,
    this.assigneeInfo,
    this.subtasksList,
    this.isAdmin,
    this.isMyTask,
    this.image,
    this.imageUrl,
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
  bool? isAdmin;
  bool? isMyTask;
  bool? isloading = false;
  ProjectUser? assigneeInfo;
  List<SubtasksList>? subtasksList;
  File? image;
  String? imageUrl;

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
    isAdmin: json["isAdmin"],
    isMyTask: json["isMyTask"],
    imageUrl: json["image"],
    assigneeInfo: json["assignee info"] != null?ProjectUser.fromJson(json["assignee info"]):null,
    subtasksList: List<SubtasksList>.from(json["subtasks list"].map((x) => SubtasksList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "deadline": "${deadline!.year.toString().padLeft(4, '0')}-${deadline!.month.toString().padLeft(2, '0')}-${deadline!.day.toString().padLeft(2, '0')}",
    "status_id": statusId,
    "sprint_id": sprintId,
    "priority": priority,
    "user_id": userId,
  };
}

SubtasksList subtasksListFromJson(String str) => SubtasksList.fromJson(json.decode(str));
class SubtasksList {
  SubtasksList({
    this.id,
    this.name,
    this.description,
    this.taskId,
  });

  int? id;
  String? name;
  String? description;
  int? taskId;

  factory SubtasksList.fromJson(Map<String, dynamic> json) => SubtasksList(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    taskId: json["task_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "task_id": taskId,
  };
}
