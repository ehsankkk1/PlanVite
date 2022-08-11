// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    required this.data,
    this.message,
  });

  Data data;
  dynamic message;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.name,
    required this.rating,
    this.phoneNumber,
    this.image,
    this.userRatingCount,

  });

  int id;
  String email;
  String name;
  num? rating;
  dynamic phoneNumber;
  dynamic image;
  int? userRatingCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    rating: json["rating"],
    phoneNumber: json["phone_number"],
    image: json["image"],
    userRatingCount: json["UserRatingCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "rating": rating,
    "phone_number": phoneNumber,
    "image": image,
    "UserRatingCount":userRatingCount,
  };
}
