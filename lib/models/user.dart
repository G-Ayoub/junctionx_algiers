import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String userToJson(User data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class User {
  String userId;
  String firstName;
  String lastName;
  String email;
  String tableNumber;
  String function;
  String favMovie;
  String aboutYou;
  String imgUrl;
  String visitorNumber;

  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.tableNumber,
    this.function,
    this.favMovie,
    this.aboutYou,
    this.imgUrl,
    this.visitorNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        tableNumber:json["tableNuMBER"],
        function:json["function"],
        favMovie:json["favMovie"],
        aboutYou:json["aboutYou"],
        imgUrl:json["imgUrl"],
        visitorNumber:json["visitorNumber"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "tableNumber":tableNumber,
        "function":function,
         "favMovie":favMovie,
         "aboutYou":aboutYou,
         "imgUrl":imgUrl,
          "visitorNumber":visitorNumber,
      };

  factory User.fromDocument(DocumentSnapshot doc) {
    return User.fromJson(doc.data);
  }
}
