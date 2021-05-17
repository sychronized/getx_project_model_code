import 'package:get/get.dart';
import 'package:model_app/bindings/home_binding.dart';
import 'package:model_app/bindings/splash_binding.dart';
import 'package:model_app/ui/pages/home/HomeView.dart';
import 'package:model_app/ui/pages/home/SplashView.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
