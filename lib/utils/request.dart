import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = CancelToken();

  static HttpUtil getInstance() {
    if (null == instance) instance = HttpUtil();
    return instance;
  }

  /*
   * 配置和初始化Dio
   */
  HttpUtil() {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl: '',
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      //Http请求头.
      headers: {
        // 配置请求头数据
        // "version": "1.0.0"
      },
      //请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
      // contentType: ContentType.json,
      //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      // responseType: ResponseType.plain,
    );

    dio = Dio(options);

    //Cookie管理
    dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前");
      return options; //continue
    }, onResponse: (Response response) {
      print("响应之前");
      return response; // continue
    }, onError: (DioError e) {
      print("错误之前");
      return e; //continue
    }));
  }

  /*
   * get请求
   *  url：请求地址
   *  data：请求参数
   *  options：请求配置
   *  cancelToken：取消标识
   */
  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('get success---------${response.statusCode}');
      // response.data; 响应体
      // response.headers; 响应头
      // response.request; 请求体
      // response.statusCode; 状态码
    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
    return response;
  }

  /*
   * post请求
   *  url：请求地址
   *  data：请求参数
   *  options：请求配置
   *  cancelToken：取消标识
   */
  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('post success---------${response.data}');
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response;
  }

  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
      print('downloadFile success---------${response.data}');
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
    }
    return response.data;
  }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      print("请求取消");
    } else {
      print("未知错误");
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
