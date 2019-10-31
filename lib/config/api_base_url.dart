/*
 * baseUrl配置
 * createTime: 2019-10-29
 * author：bqc
 */

enum Env {
  OBT,
  UAT,
  SIT,
}

// 获取baseUrl
class URLConfig {
  static Env env;
  static Map<String, String> get apiHost {
    switch (env) {
      case Env.SIT:
        return sitURL;
      case Env.UAT:
        return uatURL;
      case Env.OBT:
        return obtURL;
      default:
        return obtURL;
    }
  }
}

Map<String, String> sitURL = {};

Map<String, String> uatURL = {};

Map<String, String> obtURL = {};
