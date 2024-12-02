import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_todo/screens/todolist.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todolist(),
    );
  }
}
