import 'package:flutter/material.dart';

class MyTodoList extends StatefulWidget {
  const MyTodoList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyTodoListState();
  }
}

class Todo {
  String title;
  String content;
  int id;
  Todo({required this.title, required this.content, required this.id});
}

class _MyTodoListState extends State<MyTodoList> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final todos = <Todo>[];
  final completed = <Todo>[];
  var id = 0;

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void addTodo(String title, String content, int id) {
    setState(() {
      todos.add(Todo(content: content, title: title, id: id));
    });
  }

  void completedTodo(int id) {
    setState(() {
      var index = todos.indexWhere((todo) => todo.id == id);
      var todo = todos.removeAt(index);
      completed.add(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: todos.map((todo) {
                var title = todo.title;
                var content = todo.content;
                return Row(
                  children: [
                    Text("$title - $content"),
                    ElevatedButton(
                        onPressed: () {
                          completedTodo(todo.id);
                        },
                        child: const Text("x")),
                  ],
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView(
              children: completed.map((completed) {
                var title = completed.title;
                var content = completed.content;
                return Text("$title - $content");
              }).toList(),
            ),
          ),
          TextField(
            decoration: InputDecoration(label: Text("title")),
            controller: titleController,
          ),
          TextField(
              decoration: InputDecoration(label: Text("content")),
              controller: contentController),
          ElevatedButton(
              onPressed: () {
                addTodo(titleController.text, contentController.text, id);
                id += 1;
              },
              child: const Text("+")),
        ],
      ),
    );
  }
}
