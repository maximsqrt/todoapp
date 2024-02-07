import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// Model class to represent a task item
class Task {
  String taskName;
  bool isNote;

  Task({required this.taskName, this.isNote = false});
}

// ChangeNotifier class to manage the state of the task list
class TaskList extends ChangeNotifier {
  List<Task> tasks = List.generate(10, (index) => Task(taskName: ''));

  // Method to update the task name at a specific index
  void updateTaskName(int index, String taskName) {
    tasks[index].taskName = taskName;
    notifyListeners(); // Notify listeners about the change
  }

  // Method to toggle the note status at a specific index
  void toggleNoteStatus(int index) {
    tasks[index].isNote = !tasks[index].isNote;
    notifyListeners(); // Notify listeners about the change
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskList(), // Provide an instance of TaskList
      child: MaterialApp(
        title: 'To-Do List',
        home: ToDoList(),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final int index;

  TaskItem(this.index);

  @override
  Widget build(BuildContext context) {
    // Access the TaskList instance using Provider
    final taskList = Provider.of<TaskList>(context);
    final task = taskList.tasks[index];

    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: task.isNote ? Colors.green : Colors.white,
        ),
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Task ${index + 1}',
          ),
          style: const TextStyle(color: Colors.black), // Text color
          onChanged: (value) {
            // Update task name when text changes
            taskList.updateTaskName(index, value);
          },
        ),
      ),
      trailing: Checkbox(
        value: task.isNote,
        onChanged: (value) {
          // Toggle note status when checkbox is changed
          taskList.toggleNoteStatus(index);
        },
      ),
    );
  }
}

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 142, 202),
      appBar: GradientAppBar(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.green],
        ),
        title: const Text('To-Do List', style: TextStyle(fontSize: 20)),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TaskItem(index);
        },
      ),
    );
  }
}

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const _defaultHeight = 150.0;

  final double elevation;
  final Gradient gradient;
  final Widget title;
  final double barHeight;

  GradientAppBar({
    this.elevation = 3.0,
    required this.gradient,
    required this.title,
    this.barHeight = _defaultHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      decoration: BoxDecoration(
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, elevation),
            color: Colors.black.withOpacity(0.3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Center(child: title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(barHeight);
}
