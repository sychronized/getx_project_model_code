import 'package:model_app/data/model/HomeModel.dart';
import 'package:model_app/data/provider/home_api_provider.dart';

class HomeRepository {
  final HomeProvider provider;
  HomeRepository({this.provider});

  Future<HomeModel> getData() async {
    HomeModel data = await provider.getData();
    if (data.code!= 200) {
      return Future.error(data.msg);
    } else {
      return data;
    } 
  }
}
