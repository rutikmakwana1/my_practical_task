import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';





// FirebaseMessaging messaging = FirebaseMessaging.instance;
// var device_token;
//
// getDeviceToken() async {
//   print('device_token');
//   device_token = await messaging.getToken();
//   print('Device Token :-> ${device_token}');
// }


 getDeviceToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();

  print("Device Token:========> $token");
}

void requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}


Dio dio = Dio();

final box = GetStorage();


final customerIndicator = SpinKitCircle(color: Color(0xff07BC7A), size: 50.0);

class Toasty {
  static showtoast(String message, {int second = 5, backgroundColor}) {
    Fluttertoast.showToast(
      timeInSecForIosWeb: second,
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      backgroundColor: backgroundColor ?? Colors.black,
    );
  }
}