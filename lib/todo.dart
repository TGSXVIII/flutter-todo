import 'package:flutter/material.dart';

class MyTodoList extends StatelessWidget {
  const MyTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Column(
          children: [
            ListView(
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (_) {}),
                    const Text("Flutter todo app")
                  ],
                )
              ],
            ),
            ElevatedButton(onPressed: () {}, child: const Text("+"))
          ],
        ),
      ],
    ));
  }
}
