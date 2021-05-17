import 'package:get/get.dart';
import 'package:model_app/data/model/HomeModel.dart';
import 'package:model_app/data/repository/home_repository.dart';

class HomeController extends SuperController<HomeModel> {
  HomeController({this.homeRepository});

  /// inject repo abstraction dependency
  final HomeRepository homeRepository;

  @override
  void onInit() {
    super.onInit();
    homeRepository.getData().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
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
