// To parse this JSON data, do
//
//     final personalTask = personalTaskFromJson(jsonString);

import 'dart:convert';

PersonalTask personalTaskFromJson(String str) => PersonalTask.fromJson(json.decode(str));

String personalTaskToJson(PersonalTask data) => json.encode(data.toJson());

class PersonalTask {
  PersonalTask({
    required this.data,
    required this.message,
  });

  Data data;
  String message;

  factory PersonalTask.fromJson(Map<String, dynamic> json) => PersonalTask(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.deadline,
    required this.userId,
    required this.completed,
  });

  int id;
  String name;
  String description;
  DateTime deadline;
  int userId;
  String completed;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    deadline: DateTime.parse(json["deadline"]),
    userId: json["user_id"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "deadline": "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
    "user_id": userId,
    "completed": completed,
  };
}
