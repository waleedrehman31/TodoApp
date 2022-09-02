// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            const Center(
              child: Text(
                "Your Todos",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            card(),
            const SizedBox(
              height: 5,
            ),
            card(),
            const SizedBox(
              height: 5,
            ),
            card(),
          ],
        ),
      ),
    );
  }

  Card card() {
    return Card(
      elevation: 2.0,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("This is first"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () => print("Button pressed"),
                  child: const Text('Edit'),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () => print("Button pressed"),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
