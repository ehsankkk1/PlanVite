// To parse this JSON data, do
//
//     final projects = projectsFromJson(jsonString);

import 'dart:convert';

List<Projects> projectsFromJson(String str) => List<Projects>.from(json.decode(str).map((x) => Projects.fromJson(x)));

String projectsToJson(List<Projects> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Projects {
  Projects({
    this.id,
    this.name,
    this.description,
    this.deadline,
  });

  int? id;
  String? name;
  String? description;
  DateTime? deadline;

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    deadline: DateTime.parse(json["deadline"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "deadline": "${deadline!.year.toString().padLeft(4, '0')}-${deadline!.month.toString().padLeft(2, '0')}-${deadline!.day.toString().padLeft(2, '0')}",
  };
}
