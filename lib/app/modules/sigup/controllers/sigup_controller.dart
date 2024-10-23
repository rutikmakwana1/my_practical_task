import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_practical/app/data/constant.dart';
import 'package:my_practical/app/modules/home/views/home_view.dart';

class SigupController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var isLoading = false.obs;

  @override
  void onInit() {
    // getDeviceToken();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  signUp_api() async {
    isLoading.value = true;
    var connectivityResult = await Connectivity().checkConnectivity();

    if(connectivityResult[0] == ConnectivityResult.none){
      isLoading.value = false;
      Toasty.showtoast("Internet Connectivity is Lost Please Check",backgroundColor: Colors.red,second: 5);
    }else{
      final response = await dio.post(
        'https://joblycanada.staging9dot.com/api/register',
        data: {
          'first_name': firstName.text,
          'last_name': lastName.text,
          'mobile_no': mobileNo.text,
          'device_type': 'android',
          'device_token': "Abc",
          'email_id': email.text,
          'password': password.text,
        },
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        if (response.data['status'] == true) {
          box.write('user_token', response.data['data']['token']);
          Toasty.showtoast("SignUp Successfully ",
              backgroundColor: Colors.green, second: 4);

          Get.offAll(HomeView(), transition: Transition.rightToLeft);
        } else {
          Toasty.showtoast(
              "${response.data['message']}\nSomething Went Wrong Please Try Again",
              backgroundColor: Colors.red,
              second: 4);
        }

        print("response is here $response");
      } else {
        isLoading.value = false;
        Toasty.showtoast("Something Went Wrong Please Try Again");
      }
    }

  }
}
