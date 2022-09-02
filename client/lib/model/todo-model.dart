// To parse this JSON data, do
//
//     final todos = todosFromJson(jsonString);

import 'dart:convert';

List<Todos> todosFromJson(String str) =>
    List<Todos>.from(json.decode(str).map((x) => Todos.fromJson(x)));

String todosToJson(List<Todos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todos {
  Todos({
    required this.id,
    required this.todo,
    required this.isCompelte,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String todo;
  bool isCompelte;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Todos.fromJson(Map<String, dynamic> json) => Todos(
        id: json["_id"],
        todo: json["todo"],
        isCompelte: json["isCompelte"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "todo": todo,
        "isCompelte": isCompelte,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
