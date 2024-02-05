import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  final int index;

  TaskItem(this.index);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  String task = '';
  bool note = false;

  @override
  Widget build(BuildContext context) {
    Color textFieldColor = note ? Colors.green : Colors.white;

    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: textFieldColor,
        ),
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Task ${widget.index + 1}',
          ),
          style: TextStyle(color: Colors.black), // Text color
          onChanged: (value) {
            setState(() {
              task = value;
            });
          },
        ),
      ),
      trailing: Checkbox(
        value: note,
        onChanged: (value) {
          setState(() {
            note = value!;
          });
        },
      ),
    );
  }
}

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 188, 142, 202),
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.green],
        ),
        title: Text('To-Do List', style: TextStyle(fontSize: 20)),
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

void main() {
  runApp(MaterialApp(
    home: ToDoList(),
  ));
}
