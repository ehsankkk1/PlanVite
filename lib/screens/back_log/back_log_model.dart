// To parse this JSON data, do
//
//     final projectUser = projectUserFromJson(jsonString);

import 'dart:convert';

ProjectUser oneProjectUserFromJson(String str) => ProjectUser.fromJson(json.decode(str));

List<ProjectUser> projectUserFromJson(String str) => List<ProjectUser>.from(json.decode(str).map((x) => ProjectUser.fromJson(x)));


class ProjectUser {
  ProjectUser({
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
  num? rating;
  num? phoneNumber;
  String? image;

  factory ProjectUser.fromJson(Map<String, dynamic> json) => ProjectUser(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    rating: json["rating"],
    phoneNumber: json["phone_number"],
    image: json["image"],
  );

}
