import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class Noti {
  static Future initialize( FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var android = const AndroidInitializationSettings('mipmap/ic_launcher');
    var iOS = const IOSInitializationSettings();
    var initSetttings = InitializationSettings(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.initialize(initSetttings);
  }

  // methode that call the notification based on the time
  static Future showNotification({
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    required String title,
    required String body,
    required var payload,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
            'Task Notification',
            'Reminder',
            playSound: true,
            // sound:RawResourceAndroidNotificationSound('notification'),
            enableVibration: true,
            importance: Importance.max,
            priority: Priority.high
        );

    var not = NotificationDetails(android: androidPlatformChannelSpecifics,
        iOS: const IOSNotificationDetails());
    await flutterLocalNotificationsPlugin.show(payload, title, body, not);
  }
}
