// To parse this JSON data, do
//
//     final projectUser = projectUserFromJson(jsonString);

import 'dart:convert';

ProjectUser projectUserFromJson(String str) => ProjectUser.fromJson(json.decode(str));

String projectUserToJson(ProjectUser data) => json.encode(data.toJson());

class ProjectUser {
  ProjectUser({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  String? name;
  String? description;

  factory ProjectUser.fromJson(Map<String, dynamic> json) => ProjectUser(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}
