import 'package:flutter/material.dart';
import 'package:get/get.dart';




import '../static/OnBoardin_Image.dart';


class onbording_controll extends GetxController {
  late PageController pagecontroller;
  int change = 0;
  //serveces serve = Get.find();
  next() {
    change++;
    if (change > onbord_data.length - 1) {
     // serve.shared.setString('count', '1');
      //Get.offAll(sign_up());
    }
    pagecontroller.animateToPage(change,
        duration: Duration(microseconds: 500), curve: Curves.easeInOut);
  }

  onchangpage(int index) {
    change = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    // TODO: implement onInit
    super.onInit();
  }
}