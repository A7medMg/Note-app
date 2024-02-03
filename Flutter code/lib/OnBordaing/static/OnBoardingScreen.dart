import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import 'package:get/get.dart';

import '../Controller/OnBoradingController.dart';
import 'OnBoardin_Image.dart';

class onbord extends StatelessWidget {
  const onbord({super.key});

  @override
  Widget build(BuildContext context) {
  //  Get.put(onbording_controll());
    return Scaffold(body: GetBuilder<onbording_controll>(
      builder: (controller) {
        return Column(
          children: [
            Expanded(flex: 3, child: page_view()),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    ...List.generate(
                        onbord_data.length,
                            (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          width: 15,
                          height: 15,
                          margin: EdgeInsets.only(right: 10),
                          curve: Curves.bounceIn,
                          decoration: BoxDecoration(
                              color: controller.change == index
                                  ? Colors.blue
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        )),
                    Spacer(),
                    controller.change != onbord_data.length - 1
                        ? MaterialButton(
                      onPressed: () {
                        controller.next();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.navigate_next,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                    )
                        : ElevatedButton(
                        style:ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () {
                          controller.next();
                        },
                        child: Text('Get Start',style: TextStyle(fontSize: 15,fontFamily: 'hed',color: Colors.white,),))
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}

class page_view extends GetView<onbording_controll> {
  const page_view({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      onPageChanged: (val) {
        controller.onchangpage(val);
      },
      itemCount: onbord_data.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: Container(
                  height: Get.height / 3,
                  child: Lottie.asset(onbord_data[index].image!,
                      fit: BoxFit.fill)),
            ),
            Text(
              onbord_data[index].title!,
              style: TextStyle(fontSize: 22, fontFamily: 'hed'),
            ),
            SizedBox(
              height: 30,
            ),
            Text(onbord_data[index].discrption!,
                style: TextStyle(fontSize: 18, fontFamily: 'cairo'))
          ],
        );
      },
    );
  }
}