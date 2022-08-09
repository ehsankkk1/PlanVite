// To parse this JSON data, do
//
//     final statues = statuesFromJson(jsonString);

import 'dart:convert';

List<Statues> statuesFromJson(String str) => List<Statues>.from(json.decode(str).map((x) => Statues.fromJson(x)));

String statuesToJson(List<Statues> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Statues {
  Statues({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Statues.fromJson(Map<String, dynamic> json) => Statues(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
