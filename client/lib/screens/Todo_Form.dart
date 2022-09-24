import 'package:client/model/todo_model.dart';
import 'package:client/screens/Home.dart';
import 'package:client/services/todo_services.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _todoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool PostDate() {
    try {
      final List<Todo> todo = [
       Todo(todo: _todoController.text, isCompelte: false)
      ];
      RemoteService.postData(todo);
      return true;
    } catch (ex) {
      throw ex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Form"),
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
                    "add New Todo",
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
                        MaterialPageRoute(builder: (context) => const MyForm()),
                      );
                    },
                    child: const Text('Add Todo'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "I want to do",
                        labelText: "Todo",
                        border: OutlineInputBorder()),
                    controller: _todoController,
                    validator: (val) {
                      if (val == null) return "Please Enter the Todo";
                      if (val.length < 2) {
                        return "Length must be greater than 2";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      _formKey.currentState?.validate();
                      if (PostDate()) {
                        return Navigator.pop(context);
                      }
                    },
                    child: const Text('Add'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: const Text('Back'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
