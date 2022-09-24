import 'dart:convert';

import 'package:client/model/todo_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future<List<Todo>?> fetchTodo() async {
    var uri = Uri.parse('http://localhost:5000/v1/api/');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return todoFromJson(jsonString);
    } else {
      return null;
    }
  }

  static void postData(List<Todo> data) async {
    var uri = Uri.parse('http://localhost:5000/v1/api/');

    await http.post(uri,
        headers: {'Content-Type': 'application/json'}, body: todoToJson(data));
  }

  updateData({required List<Todo> data, required id}) async {
    var uri = Uri.parse('http://localhost:5000/v1/api/${id}');

    await http.put(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todoToJson(data)));
  }

  static void deleteData(var id) async {
    var uri = Uri.parse('http://localhost:5000/v1/api/${id}');

    await http.delete(
      uri,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
