// To parse this JSON data, do
//
//     final viewTask = viewTaskFromJson(jsonString);

import 'dart:convert';

ViewTask viewTaskFromJson(String str) => ViewTask.fromJson(json.decode(str));

String viewTaskToJson(ViewTask data) => json.encode(data.toJson());

class ViewTask {
  ViewTask({
    required this.data,
    this.message,
  });

  Data data;
  dynamic message;

  factory ViewTask.fromJson(Map<String, dynamic> json) => ViewTask(
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
    this.description,
    required this.deadline,
    required this.sprintId,
    required this.userId,
    required this.statusId,
    required this.priority,
    required this.isAdmin,
    required this.isMyTask,
    required this.assigneeInfo,
    required this.subtasksList,
  });

  int id;
  String name;
  dynamic description;
  DateTime deadline;
  int sprintId;
  int userId;
  int statusId;
  String priority;
  bool isAdmin;
  bool isMyTask;
  AssigneeInfo assigneeInfo;
  List<SubtasksList> subtasksList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    assigneeInfo: AssigneeInfo.fromJson(json["assignee info"]),
    subtasksList: List<SubtasksList>.from(json["subtasks list"].map((x) => SubtasksList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "deadline": "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
    "sprint_id": sprintId,
    "user_id": userId,
    "status_id": statusId,
    "priority": priority,
    "isAdmin": isAdmin,
    "isMyTask": isMyTask,
    "assignee info": assigneeInfo.toJson(),
    "subtasks list": List<dynamic>.from(subtasksList.map((x) => x.toJson())),
  };
}

class AssigneeInfo {
  AssigneeInfo({
    required this.id,
    required this.email,
    required this.name,
    this.rating,
    this.phoneNumber,
    this.image,
  });

  int id;
  String email;
  String name;
  dynamic rating;
  dynamic phoneNumber;
  dynamic image;

  factory AssigneeInfo.fromJson(Map<String, dynamic> json) => AssigneeInfo(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    rating: json["rating"],
    phoneNumber: json["phone_number"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "rating": rating,
    "phone_number": phoneNumber,
    "image": image,
  };
}

class SubtasksList {
  SubtasksList({
    required this.id,
    required this.name,
    required this.description,
    required this.taskId,
  });

  int id;
  String name;
  String description;
  int taskId;

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
