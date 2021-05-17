import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_app/common/baseContext.dart';
import 'package:model_app/common/my_material.dart';
import 'package:model_app/controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    BaseContext.baseContext = context;
    return Material(
      child: controller.obx((state) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText("学英语就上\n  每日一句", 36.s, c333333, false, 2),
              ])),
    );
  }
}
