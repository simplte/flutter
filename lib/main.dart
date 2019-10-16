import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart'; // ui库
import 'bottom_navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bqc/routers.dart';
import 'package:flutter_bqc/application.dart';

// 入口文件
void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
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
