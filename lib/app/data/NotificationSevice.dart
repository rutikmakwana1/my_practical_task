import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final notifications = FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('ic_launcher_round');
  final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
    defaultPresentAlert: true,
    defaultPresentBadge: true,
    defaultPresentSound: true,
  );

  var notificationType;
  var boardId;
  listenNotification() async {
    var initializationSettings = InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    notifications.initialize(initializationSettings, onSelectNotification: onSelectNotification);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print(message.data);
      print("message.data is here");
      notificationType = message.data['notification_type'];
      boardId = message.data['board_id'];
      RemoteNotification? notification = message.notification;
      AppleNotification? ios = message.notification?.apple;
      if (notification != null && ios != null) {

      }
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        notifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails('1', 'User Activity', icon: 'ic_launcher_round'),
            iOS: IOSNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print(message.data);
      print("message.data is here");

    });

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) async {

    });
  }

  Future<dynamic> onSelectNotification(payload) async {

  }
}