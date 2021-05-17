import 'package:get/get.dart';
import 'package:model_app/routes/app_pages.dart';

class SplashController extends SuperController {
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
    _delayGoHome();
  }

  void _delayGoHome() {
    //延时500毫秒执行
    Future.delayed(Duration(milliseconds: 3000), () {
      //延时执行的代码
      Get.offNamed(Routes.HOME);
    });
  }

  @override
  void onDetached() {
    print("implement onDetached");
  }

  @override
  void onInactive() {
    print("implement onInactive");
  }

  @override
  void onPaused() {
    print("implement onPaused");
  }

  @override
  void onResumed() {
    print("implement onResumed");
  }
}
