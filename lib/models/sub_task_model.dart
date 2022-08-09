// To parse this JSON data, do
//
//     final subTask = subTaskFromJson(jsonString);

import 'dart:convert';

SubTask subTaskFromJson(String str) => SubTask.fromJson(json.decode(str));

String subTaskToJson(SubTask data) => json.encode(data.toJson());

class SubTask {
  SubTask({
    required this.data,
    required this.message,
  });

  Data2 data;
  String message;

  factory SubTask.fromJson(Map<String, dynamic> json) => SubTask(
    data: Data2.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}

class Data2 {
  Data2({
    required this.id,
    required this.name,
    required this.description,
    required this.taskId,
  });

  int id;
  String name;
  String description;
  int taskId;

  factory Data2.fromJson(Map<String, dynamic> json) => Data2(
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
