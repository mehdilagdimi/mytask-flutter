import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../models/Notification.dart';
import '../details/Task.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Home Page'),
//     ),
//     body: const Center(
//       child: Text('Home Page'),
//     ),
//   );
// }

  class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var tasks = [
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Task Manage',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addTask');
                  },
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
          // body with list of tasks
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index].title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text('Priority: ${tasks[index].priority}'),
                      const SizedBox(height: 5),
                      Text('Date: ${tasks[index].date}'),
                      const SizedBox(height: 5),
                      Text('Time: ${tasks[index].time}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      Noti.showNotification(
                        flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
                        title: tasks[index].title,
                        body: tasks[index].priority,
                        payload: index,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }}
