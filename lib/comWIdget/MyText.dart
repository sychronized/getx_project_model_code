import 'package:flutter/material.dart';

class MyText extends Text {
  final String title; //标题
  final Color color; //颜色
  final double fontSize; //字体大小
  final bool fontWeight; //字重
  final int maxLine; //最大行数
  final double height;
  MyText(
    this.title, [
    this.fontSize = 0,
    this.color,
    this.fontWeight = false,
    this.maxLine = 2,
    this.height = 1.3,
  ]) : super(title);
  @override
  TextStyle get style => TextStyle(
        color: color,
        fontSize: fontSize == 0 ? null : fontSize,
        fontWeight: fontWeight ? FontWeight.bold : null,
        height: height,
      );
  @override
  int get maxLines => maxLine;

  @override
  TextOverflow get overflow => TextOverflow.ellipsis;
}
