import 'package:flutter/material.dart';
import 'package:simple_todo/todo.dart';

class TodoNew extends StatefulWidget {
  const TodoNew({super.key});

  @override
  State<TodoNew> createState() => _TodoNewState();
}

class _TodoNewState extends State<TodoNew> {
  @override
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo New Item'),
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
                  autovalidateMode: AutovalidateMode.always,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your Title';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Write Your titile here',
                    label: Text('Title'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _descriptionTEController,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    hintText: 'Write Your description here',
                    labelText: 'Description',
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your Title';
                    }
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Todo? todo = Todo(
                            title: _titleTEController.text.trim(),
                            Description: _descriptionTEController.text.trim());

                        Navigator.pop(context, todo);
                      }
                    },
                    child: Text('add'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
