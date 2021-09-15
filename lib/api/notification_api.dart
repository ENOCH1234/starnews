import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel is',
        'channel name',
        'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String ?payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );
}