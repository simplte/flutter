import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bqc/page/search.dart';
import 'package:flutter_bqc/route/route_handlers.dart';

class Routes {
  static Router router;

  static String root = '/';
  static String search = '/search';
  static String zhuan = '/zhuan';
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('地址无效');
      return SearhPage();
    });
    router.define(root, handler: homeHandler);
    router.define(search, handler: searchHandler);
    router.define(zhuan, handler: zhuanHandler);
    Routes.router = router;
  }
}
