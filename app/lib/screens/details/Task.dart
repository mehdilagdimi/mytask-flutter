import 'package:flutter/material.dart';

class Task {
  final String title;
  final String priority;
  final DateTime date;
  final String time;

  Task({
    required this.title,
    required this.priority,
    required this.date,
    required this.time,
  });
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});


  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(
        title: "Buy groceries",
        priority: "High",
        date: DateTime.now().add(Duration(days: 1)),
        time: "10:00 AM"),
    Task(
        title: "Attend meeting",
        priority: "Normal",
        date: DateTime.now(),
        time: "2:00 PM"),
    Task(
        title: "Complete project",
        priority: "High",
        date: DateTime.now().add(Duration(days: 3)),
        time: "11:00 AM"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text('Priority: ${tasks[index].priority}'),
                SizedBox(height: 5),
                Text('Date: ${tasks[index].date.toString().substring(0, 10)}'),
                SizedBox(height: 5),
                Text('Time: ${tasks[index].time}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.alarm),
              onPressed: () {
                // TODO: Add code to show reminder options
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO: Add code to show task creation form
        },
      ),
    );
  }
}