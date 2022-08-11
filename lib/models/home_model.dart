// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  Home({
    required this.data,
  });

  Data data;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.projects,
    required this.tasksDoneInAllProject,
  });

  List<Project> projects;
  String tasksDoneInAllProject;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    projects: List<Project>.from(json["projects"].map((x) => Project.fromJson(x))),
    tasksDoneInAllProject: json["tasksDoneInAllProject"],
  );

  Map<String, dynamic> toJson() => {
    "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
    "tasksDoneInAllProject": tasksDoneInAllProject,
  };
}

class Project {
  Project({
    this.id,
    this.name,
    this.deadline,
    this.isAdmin,
    this.totalDays,
    this.daysGone,
    this.tasksDoneInProject,
    this.tasksDoneInSprint,
  });

  dynamic id;
  dynamic name;
  dynamic deadline;
  dynamic isAdmin;
  num? totalDays;
  num? daysGone;
  num? tasksDoneInProject;
  num? tasksDoneInSprint;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"],
    name: json["name"],
    deadline: json["deadline"],
    isAdmin: json["isAdmin"],
    totalDays: json["totalDays"],
    daysGone: json["daysGone"],
    tasksDoneInProject: json["tasksDoneInProject"],
    tasksDoneInSprint: json["tasksDoneInSprint"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "deadline": deadline,
    "isAdmin": isAdmin,
    "totalDays": totalDays,
    "daysGone": daysGone,
    "tasksDoneInProject": tasksDoneInProject,
    "tasksDoneInSprint": tasksDoneInSprint,
  };
}
