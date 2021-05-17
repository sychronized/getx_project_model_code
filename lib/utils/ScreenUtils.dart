import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_app/common/baseContext.dart';

//屏幕适配工具类
extension IntFit on int {
  ///适配屏幕的宽度
  double get w => ScreenUtils.setWidth(this);

  ///适配屏幕的高度
  double get h => ScreenUtils.setHeight(this);

  ///适配字体大小
  double get s => ScreenUtils.setSp(this);

  ///将时间戳转换成日期
  DateTime get date => DateTime.fromMillisecondsSinceEpoch(this);

  String get dateToyyyyMMddHHmmss => _formDate(this, 1);
  String get dateToyyyyMMdd => _formDate(this, 2);
  String get dateToHHmmss => _formDate(this, 3);
  String get dateToyyyyMMddHHmm => _formDate(this, 4);
  String get dateToHHmm => _formDate(this, 5);
  String get dateForString => _formDate(this, 6);
  String get dateToyyyyMMddHHmmpoint => _formDate(this, 7);
  String get dateTommss => _formDate(this, 8);

  String _formDate(int time, int type) {
    DateTime dateTime = time.date;
    String year = dateTime.year.toString();
    String month = dateTime.month.toString();
    if (month.length == 1) month = "0$month";
    String day = dateTime.day.toString();
    if (day.length == 1) day = "0$day";
    String hour = dateTime.hour.toString();
    if (hour.length == 1) hour = "0$hour";
    String minute = dateTime.minute.toString();
    if (minute.length == 1) minute = "0$minute";
    String second = dateTime.second.toString();
    if (second.length == 1) second = "0$second";

    switch (type) {
      case 1:
        return "$year-$month-$day $hour:$minute:$second";
      case 2:
        return "$year-$month-$day";
      case 3:
        return "$hour:$minute:$second";
      case 4:
        return "$year-$month-$day $hour:$minute";
      case 5:
        return "$hour:$minute";
      case 7:
        return "$year.$month.$day $hour:$minute";
      case 8:
        return "$minute:$second";

      case 6:
        var thisInstant = new DateTime.now();
        // milliseconds  :  今天0点时候的时间戳
        int milliseconds = thisInstant.millisecondsSinceEpoch -
            thisInstant.hour * 60 * 60 * 1000 -
            thisInstant.minute * 60 * 1000 -
            thisInstant.second * 1000;

        int yearMill = DateTime(thisInstant.year).millisecondsSinceEpoch;

        // 一天的时间戳 : 86400000
        if (time >= milliseconds) {
          //今天的
          return "$hour:$minute";
        } else if (time >= milliseconds - 86400000) {
          //昨天的
          return "昨天  $hour:$minute";
        } else if (time >= yearMill) {
          //今年的 如 2021-1-1-00:00:00 后
          return "$month-$day $hour:$minute";
        } else {
          //2021 年以前的
          return "$year-$month-$day  $hour:$minute";
        }
        break;
      default:
        return "$time";
    }
  }
}

extension DoubleFit on num {
  double get w => ScreenUtils.setWidth(this);
  double get h => ScreenUtils.setHeight(this);
  double get s => ScreenUtils.setSp(this);
  String get zero => () {
        String str = this.toString();
        if (!str.contains(".")) {
          return str;
        }
        String str2 = str.split(".")[1];
        if (str2 == "0") {
          return str.split(".")[0];
        }
        if (str2.endsWith("0")) {
          return str.split(".")[0] + "." + str2.substring(0, str2.length - 1);
        }
        return str;
      }();
}

class ScreenUtils {
  static setHeight(num height) {
    return ScreenUtil().setHeight(height);
  }

  static setWidth(num width) {
    return ScreenUtil().setWidth(width);
  }

  static setSp(num fontSize) {
    return ScreenUtil().setSp(fontSize);
  }

  // 当前屏幕的宽度
  static double get screenWidth =>
      MediaQuery.of(BaseContext.baseContext).size.width;
  //当前屏幕的高度
  static double get screenHight =>
      MediaQuery.of(BaseContext.baseContext).size.height;

  static double get getStatusBarHeight =>
      MediaQueryData.fromWindow(window).padding.top;
}
