class HomeModel {
  int code;
  String msg;
  Data data;

  HomeModel({this.code, this.msg, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String image;
  String sentence;

  Data({this.image, this.sentence});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    sentence = json['sentence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['sentence'] = this.sentence;
    return data;
  }
}
