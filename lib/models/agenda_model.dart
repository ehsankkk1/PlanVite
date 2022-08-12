// To parse this JSON data, do
//
//     final agenda = agendaFromJson(jsonString);

import 'dart:convert';

import 'package:plane_vite/models/project_user_model.dart';

List<Agenda> agendaFromJson(String str) => List<Agenda>.from(json.decode(str).map((x) => Agenda.fromJson(x)));

String agendaToJson(List<Agenda> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Agenda {
  Agenda({
    this.id,
    this.name,
    this.description,
    this.deadline,
    this.sprintId,
    this.userId,
    this.statusId,
    this.priority,
    this.isAdmin,
    this.isMyTask,
    this.assigneeInfo,
  });

  int? id;
  String? name;
  String? description;
  DateTime? deadline;
  int? sprintId;
  int? userId;
  int? statusId;
  String? priority;
  bool? isAdmin;
  bool? isMyTask;
  ProjectUser? assigneeInfo;

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    deadline: DateTime.parse(json["deadline"]),
    sprintId: json["sprint_id"],
    userId: json["user_id"],
    statusId: json["status_id"],
    priority: json["priority"],
    isAdmin: json["isAdmin"],
    isMyTask: json["isMyTask"],
    assigneeInfo: ProjectUser.fromJson(json["assignee info"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    //"deadline": "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
    "sprint_id": sprintId,
    "user_id": userId,
    "status_id": statusId,
    "priority": priority,
    "isAdmin": isAdmin,
    "isMyTask": isMyTask,

  };
}
