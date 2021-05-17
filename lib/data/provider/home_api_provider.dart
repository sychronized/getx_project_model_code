import 'package:get/get.dart';
import 'package:model_app/data/model/HomeModel.dart';
import 'package:model_app/data/provider/api.dart';
import 'package:model_app/utils/HttpUtils.dart';

class HomeProvider extends GetConnect {
  Future<HomeModel> getData() async {
    HomeModel homeModel = HomeModel.fromJson(await MyHttp().get(Api.homeData));
    return homeModel;
  }
}
