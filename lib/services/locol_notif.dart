


// import 'dart:io';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class LocaNotService {
//   static final _locaNotifications = FlutterLocalNotificationsPlugin();

//   static bool notificationsEnabled = false;

//   static Future<void> requestPermission() async {
//     if (Platform.isAndroid) {
//       final android = _locaNotifications.resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>();

//       notificationsEnabled =
//           await android?.requestExactAlarmsPermission() ?? false;

//     } else if (Platform.isIOS) {
//       final ios = _locaNotifications.resolvePlatformSpecificImplementation<
//           IOSFlutterLocalNotificationsPlugin>();

//       notificationsEnabled = await ios?.requestPermissions(
//             sound: true,
//             alert: true,
//             badge: true,
//             provisional: true,
//             critical: true,
//           ) ??
//           false;
//     }
//   }

//   static Future<void> init() async {
//     const androidSettings = AndroidInitializationSettings("image");
//     const iosSettings = DarwinInitializationSettings();

//     const initSettings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );
//     await _locaNotifications.initialize(initSettings);

//     tz.initializeTimeZones();
//   }

//   static Future<void> showNotification() async {
//     final androidNotification = AndroidNotificationDetails(
//       "SovgalarID",
//       "SovgalarKanali",
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true,
//       enableVibration: true,
//       sound: RawResourceAndroidNotificationSound("signal"),
//     );

//     final iosNotification = DarwinNotificationDetails();

//     final initNotification = NotificationDetails(
//       android: androidNotification,
//       iOS: iosNotification,
//     );

//     _locaNotifications.show(
//       0,
//       "MCHS",
//       """Siz 100 000 so'm yutub oldingiz Tabriklaymiz!!!""",
//       initNotification,
//     );
//   }

//   static Future<void> scheduleDailyMotivation() async {
//     final androidNotification = AndroidNotificationDetails(
//       "MotivationID",
//       "MotivationChannel",
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true,
//       enableVibration: true,
//     );

//     final iosNotification = DarwinNotificationDetails();

//     final initNotification = NotificationDetails(
//       android: androidNotification,
//       iOS: iosNotification,
//     );

//     _locaNotifications.periodicallyShow(
//       0,
//       "Kunlik Mativat",
//       "Kunlik motivatsiya olish vaqti keldi!",
//       RepeatInterval.daily,
//       initNotification,
//     );
//   }

//   static Future<void> scheduleTaskReminder(String task, String time) async {
//     final androidNotification = AndroidNotificationDetails(
//       "TaskReminderID",
//       "TaskReminderChannel",
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true,
//       enableVibration: true,
//     );

//     final iosNotification = DarwinNotificationDetails();

//     final initNotification = NotificationDetails(
//       android: androidNotification,
//       iOS: iosNotification,
//     );

//     // Parse time to schedule notification
//     final now = DateTime.now();
//     final scheduledTime = DateTime(now.year, now.month, now.day,
//         int.parse(time.split(':')[0]), int.parse(time.split(':')[1]));

//     // Convert scheduled time to a TZDateTime
//     final tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);

//     _locaNotifications.zonedSchedule(
//       0,
//       "Reja",
//       "Reja: $task",
//       tzScheduledTime,
//       initNotification,
//       // androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }

//   static Future<void> startPomodoro() async {
//     final androidNotification = AndroidNotificationDetails(
//       "PomodoroID",
//       "PomodoroChannel",
//       importance: Importance.max,
//       priority: Priority.max,
//       playSound: true,
//       enableVibration: true,
//     );

//     final iosNotification = DarwinNotificationDetails();

//     final initNotification = NotificationDetails(
//       android: androidNotification,
//       iOS: iosNotification,
//     );

//     _locaNotifications.periodicallyShow(
//       0,
//       "Tanafus",
//       "2 daqiqalik tanaffus qilish vaqti keldi!",
//       RepeatInterval.everyMinute,
//       initNotification,
//     );
//   }

//   static Future<void> stopPomodoro() async {
//     await _locaNotifications.cancel(0);
//   }
// }














import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocaNotService {
  static final _locaNotifications = FlutterLocalNotificationsPlugin();

  static bool notificationsEnabled = false;

  // Request permission for notifications
  static Future<void> requestPermission() async {
    if (Platform.isAndroid) {
      final android = _locaNotifications.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      notificationsEnabled =
          await android?.requestExactAlarmsPermission() ?? false;

    } else if (Platform.isIOS) {
      final ios = _locaNotifications.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();

      notificationsEnabled = await ios?.requestPermissions(
            sound: true,
            alert: true,
            badge: true,
            provisional: true,
            critical: true,
          ) ??
          false;
    }
  }

  // Initialize notifications
  static Future<void> init() async {
    const androidSettings = AndroidInitializationSettings("image");
    const iosSettings = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await _locaNotifications.initialize(initSettings);

    tz.initializeTimeZones();
  }

  static Future<void> showNotification() async {
    final androidNotification = AndroidNotificationDetails(
      "SovgalarID",
      "SovgalarKanali",
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
      sound: RawResourceAndroidNotificationSound("signal"),
    );

    final iosNotification = DarwinNotificationDetails();

    final initNotification = NotificationDetails(
      android: androidNotification,
      iOS: iosNotification,
    );

    _locaNotifications.show(
      0,
      "MCHS",
      """Siz 100 000 so'm yutub oldingiz Tabriklaymiz!!!""",
      initNotification,
    );
  }

  static Future<void> scheduleDailyMotivation() async {
    final androidNotification = AndroidNotificationDetails(
      "MotivationID",
      "MotivationChannel",
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
    );

    final iosNotification = DarwinNotificationDetails();

    final initNotification = NotificationDetails(
      android: androidNotification,
      iOS: iosNotification,
    );

    _locaNotifications.periodicallyShow(
      0,
      "Kunlik Mativat",
      "Kunlik motivatsiya olish vaqti keldi!",
      RepeatInterval.daily,
      initNotification,
    );
  }

  // Schedule task reminder
  static Future<void> scheduleTaskReminder(String task, DateTime notificationTime) async {
    final androidNotification = AndroidNotificationDetails(
      "TaskID",
      "TaskChannel",
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
      sound: RawResourceAndroidNotificationSound("signal"),
    );

    final iosNotification = DarwinNotificationDetails();

    final notificationDetails = NotificationDetails(
      android: androidNotification,
      iOS: iosNotification,
    );

    final tzNotificationTime = tz.TZDateTime.from(notificationTime, tz.local);

    await _locaNotifications.zonedSchedule(
      0,
      "Reja haqida eslatma",
      task,
      tzNotificationTime,
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> startPomodoro() async {
    final androidNotification = AndroidNotificationDetails(
      "PomodoroID",
      "PomodoroChannel",
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
    );

    final iosNotification = DarwinNotificationDetails();

    final initNotification = NotificationDetails(
      android: androidNotification,
      iOS: iosNotification,
    );

    _locaNotifications.periodicallyShow(
      0,
      "Tanafus",
      "2 daqiqalik tanaffus qilish vaqti keldi!",
      RepeatInterval.everyMinute,
      initNotification,
    );
  }

  static Future<void> stopPomodoro() async {
    await _locaNotifications.cancel(0);
  }
}
