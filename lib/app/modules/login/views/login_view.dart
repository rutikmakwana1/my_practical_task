import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_practical/app/data/constant.dart';
import 'package:my_practical/app/modules/sigup/views/sigup_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (logic) {
          return Obx(() {
            return ModalProgressHUD(
              inAsyncCall: controller.isLoading.value,
              opacity: 0,
              progressIndicator: customerIndicator,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('LoginView',
                    style: TextStyle(fontWeight: FontWeight.bold),),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 25),


                            Text("Email",
                              style: TextStyle(fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            TextFormField(
                              cursorColor: Colors.black,
                              maxLines: 1,
                              controller: controller.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(controller.email.text)) {
                                  return 'Please enter valid email';
                                }
                                return null;
                              },
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Medium',
                              ),
                              decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                counter: SizedBox(),
                                contentPadding: EdgeInsets.only(
                                    top: 17, bottom: 17, left: 10, right: 10),
                                hintText: "Enter Email",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(.4),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Regular',
                                ),
                                prefixStyle: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: "Bold",
                                  fontSize: 18,
                                ),
                                filled: true,
                                fillColor: Colors.white,

                                enabledBorder:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffEFEFEF)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff07BC7A)
                                          .withOpacity(.5)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),

                            Text("Password",
                              style: TextStyle(fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            TextFormField(
                              cursorColor: Colors.black,
                              controller: controller.Password,
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (!RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(controller.Password.text)) {
                                  return 'Please enter  8 character, one numerical, one uppercase & lowercase, one unique';
                                }
                                return null;
                              },

                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Medium',
                              ),
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                counter: SizedBox(),
                                contentPadding: EdgeInsets.only(
                                    top: 17, bottom: 17, left: 10, right: 10),
                                hintText: "Enter Password",

                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(.4),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Regular',
                                ),
                                prefixStyle: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: "Bold",
                                  fontSize: 18,
                                ),
                                filled: true,
                                fillColor: Colors.white,

                                enabledBorder:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffEFEFEF)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder:
                                OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff07BC7A)
                                          .withOpacity(.5)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),

                            SizedBox(height: 45),
                            InkWell(
                              onTap: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.login_api();
                                } else {
                                  print("else part is here");
                                }
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                height: 56,
                                width: Get.width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xff07BC7A),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text("Login",
                                  style: TextStyle(fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),),
                              ),
                            ),
                            SizedBox(height: 22),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("I don't have Account ",
                                  style: TextStyle(fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),),
                                InkWell(
                                  onTap: () {
                                    Get.offAll(SigupView());
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Text(" SignUp",
                                    style: TextStyle(fontSize: 18,
                                        color: Color(0xff07BC7A),
                                        fontWeight: FontWeight.bold),),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }
}
