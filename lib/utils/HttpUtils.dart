import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:model_app/common/UrlConfig.dart';

//网络请求工具类
class MyHttp {
  static MyHttp _instance = MyHttp._internal();
  Dio _dio;

  //单例模式
  factory MyHttp() => _instance;

  //第一次使用时初始化
  MyHttp._internal() {
    if (null == _dio) {
      BaseOptions options = new BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 30000,
      );
      _dio = new Dio(options);
      _dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        return options;
      }, onResponse: (Response response) async {
        // if (response.data["code"] != 200) {
        //   log('++++++++++++返回结果状态异常+++++++++++++');
        //   log("状态码:" + response.data["code"].toString());
        //   log("url:" + response.request.path.toString());
        //   log("message: " + response.data['msg'].toString());
        //   log('++++++++++++返回结果打印结束+++++++++++++');
        // }
        return response;
      }, onError: (DioError e) async {
        log("++++++++++++请求出错信息+++++++++++++++");
        log("出错: " + e.error.toString());
        log("请求地址: " + e.request.path.toString());
        log("请求方法: " + e.request.method.toString());
        log("状态码: " + e.response?.statusCode.toString());
        log("++++++++++++信息打印结束+++++++++++++++");
      }));
    }
  }

  /// [url]: 接口地址 ;
  /// [data]: map类型的请求数据;
  /// [needToken]: 是否携带token , 默认会自动携带token;
  Future<Map<String, dynamic>> post<SuperModel>(String url,
      {Map<String, dynamic> data, bool needToken = false}) async {
    return Map.from(await _getData(url, data, true));
  }

  Future<Map<String, dynamic>> get<SuperModel>(String url,
      {Map<String, dynamic> data, bool needToken = false}) async {
    return Map.from(await _getData(url, data, false));
  }

  Future<dynamic> _getData(
      String url, Map<String, dynamic> data, bool isPost) async {
    if (!url.startsWith("http")) url = UrlConfig.baseUrl + url; //补全url
    Response response;
    if (isPost) {
      response = await _dio.post(
        "$url",
        data: data ?? {},
        onReceiveProgress: (count, total) {},
      );
    } else {
      response = await _dio.get("$url");
    }
    return response.data is Map ? response.data : jsonDecode(response.data);
  }
}
