import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_app/common/BaseColors.dart';

///图片封装 , 网络图片未加载出来时 , 有默认图片, 本地缓存
// by: yrs

class MyImage {
  static Image asset(String path,
      {String end = "png",
      double height,
      double width,
      BoxFit fit,
      Color color}) {
    return Image.asset(
      "assets/images/$path.$end",
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      color: color,
    );
  }

  static Widget network(
    String src, //地址
    {
    double height, //高
    double width, //宽
    BoxShape shape = BoxShape.rectangle, //剪切形状
    BoxFit fit = BoxFit.cover, //布局方式
    BoxBorder border, //边框
    bool cache = true, //是否缓存
    BorderRadius borderRadius, //圆角
    bool magnify = false, //是否能点击放大
  }) {
    Widget widget1 = ExtendedImage.network(
      src ?? "",
      fit: fit,
      height: height == null ? null : height,
      width: width == null ? null : width,
      shape: shape,
      border: border,
      cache: cache,
      borderRadius: borderRadius,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Text("");
          case LoadState.completed:
            return state.completedWidget;
          case LoadState.failed:
            magnify = false;

            return Container(
              color: cF3F3F3,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/enroll/img_empty.png",
                width: 204,
                height: 57,
              ),
            );
        }
        return null;
      },
    );
    if (magnify) {
      return GestureDetector(
          onTap: () {}, child: Hero(tag: "$src", child: widget1));
    }
    return widget1;
  }
}

class ImageDital extends StatefulWidget {
  final String arguments;
  ImageDital({Key key, this.arguments}) : super(key: key);
  @override
  _ImageDitalState createState() => _ImageDitalState();
}

class _ImageDitalState extends State<ImageDital> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: Hero(
                tag: "${widget.arguments}",
                child: ExtendedImage.network(
                  widget.arguments,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  mode: ExtendedImageMode.gesture,
                  initGestureConfigHandler: (state) {
                    return GestureConfig(
                      minScale: 0.9,
                      animationMinScale: 0.7,
                      maxScale: 3.0,
                      animationMaxScale: 3.5,
                      speed: 1.0,
                      inertialSpeed: 100.0,
                      initialScale: 1.0,
                      inPageView: false,
                      initialAlignment: InitialAlignment.center,
                    );
                  },
                  onDoubleTap: (ExtendedImageGestureState state) {
                    state.reset();
                  },
                )),
          ),
        ),
      ),
    );
  }
}
