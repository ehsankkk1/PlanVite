
import 'dart:convert';

import 'package:plane_vite/models/task_model.dart';

List<ActiveSprint> activeSprintFromJson(String str) => List<ActiveSprint>.from(json.decode(str).map((x) => ActiveSprint.fromJson(x)));

String activeSprintToJson(List<ActiveSprint> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActiveSprint {
  ActiveSprint({
    this.status_id,
    this.statusName,
    this.tasks,
  });

  String? statusName;
  int? status_id;
  List<Task>? tasks;

  factory ActiveSprint.fromJson(Map<String, dynamic> json) => ActiveSprint(
    statusName: json["status_name"],
      status_id: json["status_id"],
    tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_name": statusName,
    "tasks": List<dynamic>.from(tasks!.map((x) => x.toJson())),
  };
}