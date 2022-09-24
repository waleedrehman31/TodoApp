// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<Todo> todoFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  Todo({
    this.id,
    this.todo,
    this.isCompelte,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? todo;
  bool? isCompelte;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["_id"],
        todo: json["todo"],
        isCompelte: json["isCompelte"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "todo": todo,
        "isCompelte": isCompelte,
      };
}
