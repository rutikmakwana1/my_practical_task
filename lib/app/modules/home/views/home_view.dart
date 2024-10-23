import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_practical/app/data/constant.dart';
import 'package:my_practical/app/modules/login/views/login_view.dart';
import '../controllers/home_controller.dart';
import 'package:intl/intl.dart';


class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (logic) {
          return Obx(() {
            return ModalProgressHUD(
              inAsyncCall: controller.isLoading.value,
              opacity: 0,
              progressIndicator: customerIndicator,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff07BC7A),
                  title: Text(
                    'Home View',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 18.0),
                      child: InkWell(
                        onTap: () {
                          logOutBottomBar();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Icon(
                          Icons.logout,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: controller.scroll_controller,
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.homeDataList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10,top: index == 0 ? 15 : 0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ID",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Job Name",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Job Type",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Job Location",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Salary",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Salary Type",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "State Name",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "City Name",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Date",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " ${controller.homeDataList[index].id}",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 1.7,
                                      // color: Colors.green,
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        " ${controller.homeDataList[index].jobName}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 1.7,
                                      // color: Colors.green,
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        " ${controller.homeDataList[index].jobTypeName}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 1.7,
                                      // color: Colors.green,
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        " ${controller.homeDataList[index].jobLocation}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 1.7,
                                      // color: Colors.green,
                                      child: Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        " ${controller.homeDataList[index].salary}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      " ${controller.homeDataList[index].salaryType ?? "--"}",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      " ${controller.homeDataList[index].stateName}",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      " ${controller.homeDataList[index].cityName ?? "--"}",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      " ${DateFormat(' dd MMMM, yyyy').format(
                                        DateTime.parse(controller.homeDataList[index].createdAt.toString()),
                                      )}",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      Obx(() {
                        return controller.isLoadMoreRunning.value == true ? Center(child: customerIndicator) : Container();
                      }),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  logOutBottomBar() {
    return showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 25),
                Icon(
                  Icons.logout,
                  size: 45,
                  color: Colors.red,
                ),
                SizedBox(height: 22),
                Text(
                  "Are You Sure Want To LogOut Your Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 35),
                InkWell(
                  onTap: () {
                    Get.back();
                    box.remove('user_token');
                    controller.isLoading.value = true;
                    Future.delayed(Duration(seconds: 2), () {
                      controller.isLoading.value = false;
                      Get.offAll(LoginView(),
                          transition: Transition.rightToLeft);
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    height: 52,
                    width: Get.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "LogOut",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        );
      },
    );
  }
}
