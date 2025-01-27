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
          SizedBox(height: 500, child: Text("hej"),),
            ElevatedButton(onPressed: () {}, child: const Text("+"))
          ],
        ),
      ],
    ));
  }
}
