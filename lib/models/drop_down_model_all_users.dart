// To parse this JSON data, do
//
//     final dropDownUser = dropDownUserFromJson(jsonString);

import 'dart:convert';

List<DropDownUser> dropDownUserFromJson(String str) => List<DropDownUser>.from(json.decode(str).map((x) => DropDownUser.fromJson(x)));

String dropDownUserToJson(List<DropDownUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DropDownUser {
  DropDownUser({
    this.id,
    this.name,
    //this.rating,
  });

  int? id;
  String? name;
  //dynamic rating;

  factory DropDownUser.fromJson(Map<String, dynamic> json) => DropDownUser(
    id: json["id"],
    name: json["name"],
    //rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    //"rating": rating,
  };
}
