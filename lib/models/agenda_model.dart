// To parse this JSON data, do
//
//     final agenda = agendaFromJson(jsonString);

import 'dart:convert';

Agenda agendaFromJson(String str) => Agenda.fromJson(json.decode(str));

String agendaToJson(Agenda data) => json.encode(data.toJson());

class Agenda {
  Agenda({
    required this.data,
    this.message,
  });

  List<Datum> data;
  dynamic message;

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
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
     this.subtasksList,
  });

  int? id;
  String? name;
  dynamic? description;
  DateTime? deadline;
  int? sprintId;
  int? userId;
  int? statusId;
  String? priority;
  bool? isAdmin;
  bool? isMyTask;
  AssigneeInfo? assigneeInfo;
  List<dynamic>? subtasksList;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    subtasksList: List<dynamic>.from(json["subtasks list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "deadline": "${deadline?.year.toString().padLeft(4, '0')}-${deadline?.month.toString().padLeft(2, '0')}-${deadline?.day.toString().padLeft(2, '0')}",
    "sprint_id": sprintId,
    "user_id": userId,
    "status_id": statusId,
    "priority": priority,
    "isAdmin": isAdmin,
    "isMyTask": isMyTask,
    "assignee info": assigneeInfo?.toJson(),
  };
}

class AssigneeInfo {
  AssigneeInfo({
    this.id,
    this.email,
    this.name,
    this.rating,
    this.phoneNumber,
    this.image,
  });

  int? id;
  String? email;
  String? name;
  dynamic? rating;
  dynamic? phoneNumber;
  String? image;

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
