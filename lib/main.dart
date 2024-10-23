import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async {

   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
       options: FirebaseOptions(
         apiKey: 'AIzaSyALgKBlSwr_Bayl8mOECP7_LKhnRz8XKVw',
         appId: '1:1093758562801:android:f025f1a343897f8745d450',
         messagingSenderId: '1093758562801',
         projectId: 'practica455fal-',
         storageBucket: 'practical-455fa.appspot.com',
       )
   );
  await GetStorage.init();
   await FirebaseMessaging.instance.requestPermission(
     alert: true,
     badge: true,
     sound: true,
     criticalAlert: true,
   );
   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
     alert: true,
     badge: true,
     sound: true,
   );
   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


   SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(

    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  print("firebaseMessagingBackgroundHandler in backgroun rutik");
  print(message);
  print('message  data is here 111${message.data}');
  print('messagedata is here 111 ${message.messageId}');

}
