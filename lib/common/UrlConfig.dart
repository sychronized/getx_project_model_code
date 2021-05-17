///全局网络配置类

class UrlConfig {
  static bool isdebug = false; // 是否debug模式
  static String proBaseUrl =
      "https://sichaobase.coding.net/p/sichao_ubase/d/demo/git/raw/master/"; // 生产地址
  static String testBaseUrl =
      "https://sichaobase.coding.net/p/sichao_ubase/d/demo/git/raw/master/"; //测试服务器地址

  ///图片特殊上传路径
  static String fileUploadUrl =
      "https://sichaobase.coding.net/p/sichao_ubase/d/demo/git/raw/master/";

  static String baseUrl = isdebug ? testBaseUrl : proBaseUrl;
}
