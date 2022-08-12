// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

Notifications notificationsFromJson(String str) => Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  Notifications({
    required this.data,
    this.message,
  });

  List<Datum> data;
  dynamic message;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
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
    required this.title,
    required this.body,
    required this.adder,
    required this.image,
  });

  String title;
  String body;
  Adder adder;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    body: json["body"],
    adder: Adder.fromJson(json["adder"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "adder": adder.toJson(),
    "image": image,
  };
}

class Adder {
  Adder({
    required this.id,
    required this.email,
    required this.name,
    required this.rating,
    required this.phoneNumber,

  });

  int id;
  String email;
  String name;
  String? rating;
  String? phoneNumber;


  factory Adder.fromJson(Map<String, dynamic> json) => Adder(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    rating: json["rating"].toString(),
    phoneNumber: json["phone_number"].toString(),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "rating": rating,
    "phone_number": phoneNumber,
  };
}

