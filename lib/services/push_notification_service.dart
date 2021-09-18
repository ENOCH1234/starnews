// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// class PushNotificationService{
//   final FirebaseMessaging _fcm = FirebaseMessaging();
//   Future initialize() async {
//     if(Platform.isIOS){
//       _fcm.requestNotificationPermissions(IosNotificationSettings());
//     }
//
//     _fcm.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print('onMessage: $message');
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print('onMessage: $message');
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print('onMessage: $message');
//       }
//     );
//   }
// }