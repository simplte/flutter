import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart'; // ui库

import 'package:flutter_bqc/route/routers.dart';
import 'package:flutter_bqc/config/application.dart';
import 'package:provider/provider.dart';

import 'package:flutter_bqc/providers/index.dart';
import 'package:flutter_bqc/config/api_base_url.dart';

// 入口文件
void main() {
  // 路由配置
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  // 环境配置
  URLConfig.env = Env.OBT;
  runApp(
    MultiProvider(
      providers: PorviderList,
      child: MyApp(),
    ),
  );
}

// 继承不动的组件
class MyApp extends StatelessWidget {
  // 方法重写
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'buqiancheng',
      theme: ThemeData.dark(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
