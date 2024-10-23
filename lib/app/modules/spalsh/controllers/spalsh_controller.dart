import 'dart:async';

import 'package:get/get.dart';
import 'package:my_practical/app/data/constant.dart';
import 'package:my_practical/app/modules/home/views/home_view.dart';
import 'package:my_practical/app/modules/login/views/login_view.dart';

class SpalshController extends GetxController {

  @override
  void onInit() {

    Rout();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}



  Rout() {

    Timer(
      Duration(seconds: 3),
          () => box.read('user_token') == null ? Get.offAll(
            LoginView(),transition: Transition.rightToLeft
      ) : Get.offAll(HomeView(),transition: Transition.rightToLeft)
    );
  }

}
