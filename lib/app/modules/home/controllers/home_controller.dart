import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:my_practical/app/data/constant.dart';
import 'package:my_practical/app/data/home_list_model.dart';

class HomeController extends GetxController {

var page = 1;

  var hasNextPage = true.obs, isLoadMoreRunning = false.obs,  isLoading = false.obs;

  ScrollController? scroll_controller;
List<Data> homeDataList = [];
  @override
  void onInit() {
    listenNotification();
    scroll_controller = ScrollController()..addListener(loadMore);
    homeView_list_api();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}





  homeView_list_api({LoadMore}) async {
    if (LoadMore != 1) {
      isLoading.value = true;
    }
    final response = await dio.post(
      'https://joblycanada.staging9dot.com/api/joblistapi',
      data: {
        'page' : page,
        "user_id" : "",
        "search" : "",
        "location" : "",
        "job_type" : "",
        "view_list" : "0"
      },
    );
    if (response.statusCode == 200) {
      isLoading.value = false;
      if (response.data['status'] == true) {
        home_list_model data = home_list_model.fromJson(response.data);
        if (LoadMore != 1) {
          homeDataList = data.data!;
          isLoading.value = false;
          update();
        } else {
          isLoadMoreRunning.value = false;
          if (data.data!.length > 0) {
            homeDataList.addAll(data.data!);
            isLoading.value = false;
          } else {
            hasNextPage.value = false;
          }
          update();
        }
      } else {
        Toasty.showtoast("Something Went Wrong Please Try Again",backgroundColor: Colors.red,second: 4,);
      }
      print("response is here======>>>>>>>> $response");
    } else {
      isLoading.value = false;
      Toasty.showtoast("Something Went Wrong Please Try Again");
    }
  }

Future<dynamic> loadMore() async {
  if (hasNextPage.value == true && isLoading.value == false && isLoadMoreRunning.value == false && scroll_controller!.offset >= scroll_controller!.position.maxScrollExtent) {
    isLoadMoreRunning.value = true;
    page++;
    await homeView_list_api(LoadMore: 1);
  }
}





var notificationsSelect;
final notifications = FlutterLocalNotificationsPlugin();
AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('ic_launcher');
final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
  requestSoundPermission: true,
  requestBadgePermission: true,
  requestAlertPermission: true,
  defaultPresentAlert: true,
  defaultPresentBadge: true,
  defaultPresentSound: true,
);
Future<dynamic> onSelectNotification(payload) async {
  print("notification ib on Select $notificationsSelect");

}

listenNotification() async {
  var initializationSettings = InitializationSettings(
    iOS: initializationSettingsIOS,
    android: initializationSettingsAndroid,
  );
  notifications.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print(message.data);
    print("message.data is here on Message listen");
    notificationsSelect = message.data['notification_type'];
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
          android: AndroidNotificationDetails('1', 'User Activity', icon: 'ic_launcher'),
          iOS: IOSNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true),
        ),
      );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    print(message.data);
    print("message.data is here on Message OpenApp");

  });

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) async {
    if (message != null) {
      print(message.data);
      print("message.data is here only get initial listen");

  }});

}}
