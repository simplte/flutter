import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart'; // ui库
import 'package:flutter_bqc/components/bottom_navigation.dart';
import 'package:flutter_bqc/model/model.dart';
import 'package:flutter_bqc/route/routers.dart';
import 'package:flutter_bqc/config/application.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bqc/model/model.dart';
import 'package:flutter_bqc/model/index.dart';

// 入口文件
void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
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
