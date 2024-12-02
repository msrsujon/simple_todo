import 'package:flutter/material.dart';
import 'package:simple_todo/screens/todo_new.dart';
import 'package:simple_todo/screens/updatetodolist.dart';
import '../todo.dart';

class todolist extends StatefulWidget {
  const todolist({super.key});

  @override
  State<todolist> createState() => _todolistState();
}

class _todolistState extends State<todolist> {
  final List<Todo> listOfTodo = [];

  void _addTodo(Todo todo) {
    listOfTodo.add(todo);
    setState(() {});
  }

  void _deleteTodo(int index) {
    listOfTodo.removeAt(index);
    setState(() {});
  }

  void _updateTodo(int index, Todo todo) {
    listOfTodo[index] = todo;
    setState(() {});
  }

  void _updateTodoStatus(int index, TodoStatus status) {
    listOfTodo[index].status = status;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Visibility(
        visible: listOfTodo.isNotEmpty,
        replacement: const Center(
          child: Text('This is Empty'),
        ),
        child: ListView.builder(
            itemCount: listOfTodo.length,
            itemBuilder: (context, index) {
              Todo todo = listOfTodo[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.Description),
                leading: Text(todo.status.name),
                trailing: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          _deleteTodo(index);
                        },
                        icon: Icon(Icons.delete)),
                    IconButton(
                        onPressed: () => _showStatusDialog(index),
                        icon: Icon(Icons.edit)),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => updatetodolist(
                          todoToBeUpdate: todo,
                          onUpdateTodo: (Todo updatedTodo) {
                            _updateTodo(index, updatedTodo);
                          },
                        ),
                      ));
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Todo? todo = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => TodoNew()));
          if (todo != null) {
            _addTodo(todo);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showStatusDialog(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Change Status'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Progress'),
                  onTap: () {
                    _updateTodoStatus(index, TodoStatus.Progress);
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Incomplete'),
                  onTap: () {
                    _updateTodoStatus(index, TodoStatus.InComplete);
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Completed'),
                  onTap: () {
                    _updateTodoStatus(index, TodoStatus.Completed);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
