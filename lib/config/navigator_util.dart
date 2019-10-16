import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bqc/application.dart';
import 'package:flutter_bqc/routers.dart';
import 'package:flutter_bqc/utils/fluro_convert_util.dart';

class NavigatorUtils {
  static void goBack(BuildContext context) {
    Application.router.pop(context);
  }

  static void goBackWithParms(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  static void goHomePage(BuildContext context) {
    Application.router.navigateTo(context, Routes.search, replace: true);
  }

  // 跳转到 会返回参数的 页面
  static Future goReturnParamsPage(BuildContext context) {
    return Application.router.navigateTo(context, Routes.zhuan);
  }

  // 自定义 转场动画
  static Future gotransitionCustomDemoPage(BuildContext context, String title) {
    var transition = (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return new ScaleTransition(
        scale: animation,
        child: new RotationTransition(
          turns: animation,
          child: child,
        ),
      );
    };
    return Application.router.navigateTo(context, Routes.zhuan,
        transition: TransitionType.custom,

        /// 指定是自定义动画
        transitionBuilder: transition,

        /// 自定义的动画
        transitionDuration: const Duration(milliseconds: 600));

    /// 时间
  }

  /// 使用 IOS 的 Cupertino 的转场动画，这个是修改了源码的 转场动画
  /// Fluro本身不带，但是 Flutter自带
  static Future gotransitionCupertinoDemoPage(
      BuildContext context, String title) {
    return Application.router.navigateTo(context, Routes.zhuan,
        transition: TransitionType.cupertino);
  }
}
