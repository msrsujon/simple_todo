import 'package:flutter/material.dart';
import 'package:simple_todo/screens/todolist.dart';
import '../todo.dart';

class updatetodolist extends StatefulWidget {
  const updatetodolist({
    super.key,
    required this.todoToBeUpdate,
    required this.onUpdateTodo,
  });

  final Todo todoToBeUpdate;
  final Function(Todo) onUpdateTodo;

  @override
  State<updatetodolist> createState() => _updatetodolistState();
}

class _updatetodolistState extends State<updatetodolist> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleTEController.text = widget.todoToBeUpdate.title;
    _descriptionTEController.text = widget.todoToBeUpdate.Description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update todo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: 'Title', hintText: 'Write your todo title'),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionTEController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'Write your description here'),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Todo todo = Todo(
                          title: _titleTEController.text.trim(),
                          Description: _descriptionTEController.text.trim(),
                          status: widget.todoToBeUpdate.status);

                      widget.onUpdateTodo(todo);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Update'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}