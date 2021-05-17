import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:model_app/comWIdget/MyText.dart';
import 'package:model_app/comWIdget/MyImage.dart';
import 'package:model_app/common/BaseColors.dart';
import 'package:model_app/controller/home_controller.dart';
import 'package:model_app/utils/MyToast.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Container(), title: Text("每日一句"), centerTitle: true),
        body: controller.obx((state) => WillPopScope(
              onWillPop: _isExit,
              child: Container(
                color: cF6F6F6,
                padding: EdgeInsets.only(left: 6, right: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    _renderImageView(state.data.image),
                    SizedBox(height: 12),
                    _renderSentenceView(state.data.sentence),
                  ],
                ),
              ),
            )));
  }

  _renderImageView(String url) {
    return MyImage.network(url);
  }

  _renderSentenceView(String text) {
    return MyText(text);
  }

  DateTime _lastTime;
  Future<bool> _isExit() async {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime) > Duration(milliseconds: 2000)) {
      _lastTime = DateTime.now();
      MyToast.showBottomShortToast("再次点击退出应用");
      return Future.value(false);
    }
    MyToast.cancelToast();
    SystemNavigator.pop();
    return false;
  }
}
