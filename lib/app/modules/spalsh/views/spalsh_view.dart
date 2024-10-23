import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/spalsh_controller.dart';

class SpalshView extends GetView<SpalshController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpalshController>(
        init: SpalshController(),
        builder: (logic) {
      return Scaffold(
        backgroundColor: Color(0xff07BC7A),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Spalsh View',            style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'Spalsh Screen View',
            style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
  }
}
