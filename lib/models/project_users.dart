// To parse this JSON data, do
//
//     final projectUsers = projectUsersFromJson(jsonString);

import 'dart:convert';

ProjectUsers projectUsersFromJson(String str) => ProjectUsers.fromJson(json.decode(str));

String projectUsersToJson(ProjectUsers data) => json.encode(data.toJson());

class ProjectUsers {
  ProjectUsers({
    required this.data,
    this.message,
  });

  List<Users> data;
  dynamic message;

  factory ProjectUsers.fromJson(Map<String, dynamic> json) => ProjectUsers(
    data: List<Users>.from(json["data"].map((x) => Users.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Users {
  Users({
    required this.id,
    required this.name,
    this.rating,
  });

  int id;
  String name;
  dynamic rating;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    name: json["name"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "rating": rating,
  };
}
