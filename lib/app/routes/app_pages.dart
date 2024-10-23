import 'package:get/get.dart';

import 'package:my_practical/app/modules/home/bindings/home_binding.dart';
import 'package:my_practical/app/modules/home/views/home_view.dart';
import 'package:my_practical/app/modules/login/bindings/login_binding.dart';
import 'package:my_practical/app/modules/login/views/login_view.dart';
import 'package:my_practical/app/modules/sigup/bindings/sigup_binding.dart';
import 'package:my_practical/app/modules/sigup/views/sigup_view.dart';
import 'package:my_practical/app/modules/spalsh/bindings/spalsh_binding.dart';
import 'package:my_practical/app/modules/spalsh/views/spalsh_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPALSH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGUP,
      page: () => SigupView(),
      binding: SigupBinding(),
    ),
    GetPage(
      name: _Paths.SPALSH,
      page: () => SpalshView(),
      binding: SpalshBinding(),
    ),
  ];
}
