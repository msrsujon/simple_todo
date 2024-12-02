class Todo {
  String title;
  String Description;
  TodoStatus status;

  Todo(
      {required this.title,
      required this.Description,
      this.status = TodoStatus.Progress});
}

enum TodoStatus { Progress, InComplete, Completed }
