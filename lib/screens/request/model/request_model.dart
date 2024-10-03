import 'package:get/get.dart';

List<RequestModel> requestModelFromJson(List list) =>
    List<RequestModel>.from(list.map((x) => RequestModel.fromJson(x)));

class RequestModel {
  String id;
  User? user;
  Topic topic;
  String description;
  List<String> attachments;
  RxString status;
  DateTime createdAt;
  int v;
  DateTime? closedAt;

  RequestModel({
    required this.id,
    required this.user,
    required this.topic,
    required this.description,
    required this.attachments,
    required String status,
    required this.createdAt,
    required this.v,
    this.closedAt,
  }) : status = status.obs;

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        id: json["_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        topic: Topic.fromJson(json["topic"]),
        description: json["description"] ?? "",
        attachments: List<String>.from(json["attachments"].map((x) => x)),
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]).toLocal(),
        v: json["__v"],
        closedAt: json["closedAt"] == null
            ? null
            : DateTime.parse(json["closedAt"]).toLocal(),
      );
}

class Topic {
  String id;
  String name;
  DateTime createdAt;
  int v;

  Topic({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.v,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["_id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]).toLocal(),
        v: json["__v"],
      );
}

class User {
  String id;
  String phoneNumber;
  String profilePicture;
  String email;
  String refreshToken;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  int v;

  User({
    required this.id,
    required this.phoneNumber,
    required this.profilePicture,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.email,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        profilePicture: json["profilePicture"] ?? "",
        refreshToken: json["refreshToken"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]).toLocal(),
        updatedAt: DateTime.parse(json["updatedAt"]).toLocal(),
        v: json["__v"],
      );
}
