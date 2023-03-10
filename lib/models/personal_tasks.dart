// To parse this JSON data, do
//
//     final personal = personalFromJson(jsonString);

import 'dart:convert';

Personal personalFromJson(String str) => Personal.fromJson(json.decode(str));

String personalToJson(Personal data) => json.encode(data.toJson());

class Personal {
  Personal({
    required this.data,
    required this.message,
  });

  List<Personal2> data;
  String message;

  factory Personal.fromJson(Map<String, dynamic> json) => Personal(
    data: List<Personal2>.from(json["data"].map((x) => Personal2.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Personal2{
  Personal2({
    required this.id,
    required this.name,
     this.description,
     this.deadline,
  //  required this.priority,
    required this.userId,
    required this.completed,
  });

  int id;
  String name;
  String? description;
  DateTime? deadline;
  //String priority;
  int userId;
  bool completed;

  factory Personal2.fromJson(Map<String, dynamic> json) => Personal2(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    deadline: DateTime.parse(json["deadline"]),
//    priority: json["priority"],
    userId: json["user_id"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "deadline": "${deadline!.year.toString().padLeft(4, '0')}-${deadline!.month.toString().padLeft(2, '0')}-${deadline!.day.toString().padLeft(2, '0')}",
    //"priority": priority,
    "user_id": userId,
    "completed": completed,
  };
}
