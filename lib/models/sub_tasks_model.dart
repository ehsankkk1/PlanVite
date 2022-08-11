// To parse this JSON data, do
//
//     final subTasks = subTasksFromJson(jsonString);

import 'dart:convert';

SubTasks subTasksFromJson(String str) => SubTasks.fromJson(json.decode(str));

String subTasksToJson(SubTasks data) => json.encode(data.toJson());

class SubTasks {
  SubTasks({
    required this.data,
    required this.message,
  });

  List<Datum> data;
  String message;

  factory SubTasks.fromJson(Map<String, dynamic> json) => SubTasks(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.taskId,
  });

  int id;
  String name;
  String description;
  int taskId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
