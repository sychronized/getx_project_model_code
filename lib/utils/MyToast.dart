import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:model_app/common/BaseColors.dart';

///toast 弹窗工具类

class MyToast<T extends Comparable> {
  MyToast(T str) {
    showCenterShortToast("$str");
  }

  static void showLongToast(String str) {
    Fluttertoast.showToast(
      msg: "$str",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void showBottomShortToast(String str) {
    Fluttertoast.showToast(
        msg: "$str",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM);
  }

  static void showColoredToast(String str) {
    Fluttertoast.showToast(
        msg: "$str",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  static void showShortToast(String str) {
    Fluttertoast.showToast(
        msg: "$str", toastLength: Toast.LENGTH_SHORT, timeInSecForIos: 1);
  }

  static void showTopShortToast(String str) {
    Fluttertoast.showToast(
        msg: "$str",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 1);
  }

  static void showCenterShortToast(String str) {
    Fluttertoast.showToast(
        msg: "$str",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: c000000.withOpacity(0.4),
        textColor: cFFFFFF);
  }

  static void cancelToast() {
    Fluttertoast.cancel();
  }
}
