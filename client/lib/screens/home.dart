// ignore_for_file: file_names
import 'package:client/Widget/MyCard.dart';
import 'package:client/controller/todo_controller.dart';
import 'package:client/screens/Todo_Form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Your Todos",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyForm()),
                      );
                    },
                    child: const Text('Add Todo'),
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 15,
            ),
            Obx(() {
              if (todoController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return FutureBuilder(
                  builder: ((context, snapshot) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: todoController.todoList.length,
                      itemBuilder: (context, index) {
                        return MyCard(todoController.todoList[index]);
                      },
                    );
                  }),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
