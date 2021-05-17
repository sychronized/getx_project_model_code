import 'package:get/get.dart';
import 'package:model_app/controller/home_controller.dart';
import 'package:model_app/data/provider/home_api_provider.dart';
import 'package:model_app/data/repository/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(() => HomeProvider());
    Get.lazyPut<HomeRepository>(() => HomeRepository(provider: Get.find()));
    Get.lazyPut<HomeController>(
        () => HomeController(homeRepository: Get.find()));
  }
}
 