import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'webview/home.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  static String routeName = MyApp() as String;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String? payload) async {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) =>  StarnewsHome()// put new link here
      // new AlertDialog(
      //   title: new Text('Notification'),
      //   content: new Text('$payload'),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff4f0034),
        brightness: Brightness.light, // status bar brightness
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black12),
        title: new Text('Flutter Local Notification'),
        centerTitle: true,
        elevation: 0,
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: showNotification,
          child: new Text(
            'Tap To Get a Notification',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
    );
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high,importance: Importance.max
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'New Tutorial', 'Local Notification', platform,
        payload: 'Starnews');
  }
}