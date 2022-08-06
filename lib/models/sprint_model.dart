// To parse this JSON data, do
//
//     final sprint = sprintFromJson(jsonString);

import 'dart:convert';

import 'package:plane_vite/models/task_model.dart';

List<Sprint> sprintFromJson(String str) => List<Sprint>.from(json.decode(str).map((x) => Sprint.fromJson(x)));

String sprintToJson(List<Sprint> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Sprint oneSprintFromJson(String str) => Sprint.fromJson(json.decode(str));

String oneSprintToJson(Sprint data) => json.encode(data.toJson());

class Sprint {
  Sprint({
    this.id,
    this.name,
    this.description,
    this.deadline,
    this.projectId,
    this.tasks,
  });

  int? id;
  String? name;
  String? description;
  DateTime? deadline;
  int? projectId;
  List<Task>? tasks;

  factory Sprint.fromJson(Map<String, dynamic> json) => Sprint(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    deadline: DateTime.parse(json["deadline"]),
    projectId: json["project_id"],
    tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    //"deadline": "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
    "project_id": projectId,
    "tasks": List<dynamic>.from(tasks!.map((x) => x.toJson())),
  };
}


