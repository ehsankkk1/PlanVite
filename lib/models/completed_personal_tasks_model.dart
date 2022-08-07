// To parse this JSON data, do
//
//     final completed = completedFromJson(jsonString);

import 'dart:convert';

Completed completedFromJson(String str) => Completed.fromJson(json.decode(str));

String completedToJson(Completed data) => json.encode(data.toJson());

class Completed {
  Completed({
    required this.data,
    this.message,
  });

  double data;
  dynamic message;

  factory Completed.fromJson(Map<String, dynamic> json) => Completed(
    data: json["data"].toDouble(),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
  };
}
