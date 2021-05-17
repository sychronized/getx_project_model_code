import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:model_app/bindings/splash_binding.dart';
import 'package:model_app/routes/app_pages.dart';
import 'package:model_app/ui/pages/home/SplashView.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: Size(750, 1334),
    builder: () => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      getPages: AppPages.routes,
      home: SplashView(),
    ),
  ));
}
