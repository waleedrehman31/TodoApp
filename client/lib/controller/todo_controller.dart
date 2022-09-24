// ignore_for_file: avoid_print

import 'package:client/model/todo_model.dart';
import 'package:client/services/todo_services.dart';
import 'package:get/state_manager.dart';

class TodoController extends GetxController {
  // ignore: deprecated_member_use, prefer_collection_literals
  var isLoading = true.obs;
  late var todoList = <Todo>[].obs();
  @override
  void onInit() {
    fetchTodo();
    super.onInit();
  }

  void fetchTodo() async {
    try {
      isLoading(true);
      var todos = await RemoteService.fetchTodo();
      if (todos != null) {
        todoList = todos;
      }
    } finally {
      isLoading(false);
    }
  }
}
