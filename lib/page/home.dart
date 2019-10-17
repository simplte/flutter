import 'package:flutter_bqc/config/navigator_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bqc/utils/fluro_convert_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String name = "来自第一个界面测试一下";
    int age = 14;
    double score = 6.4;
    bool sex = true;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('这是主页')),
          RaisedButton(
            child: Text('传递参数string ,int，double，bool ，自定义类型'),
            onPressed: () {
              NavigatorUtils.goDemoParamsPage(context, name, age, score, sex);
            },
          ),
          RaisedButton(
            child: Text('传递参数,接受返回值'),
            onPressed: () {
              NavigatorUtils.goReturnParamsPage(context).then((result) {
                debugPrint('${result.runtimeType}');
                String message;
                message = '$result';
                debugPrint('$result');
                showResultDialog(context, message);
              });
            },
          ),
          RaisedButton(
            child: Text('框架 自定义 转场动画 演示'),
            onPressed: () {
              NavigatorUtils.gotransitionCustomDemoPage(context,
                  FluroConvertUtils.fluroCnParamsEncode('框架 自定义 转场动画 演示'));
            },
          ),
          RaisedButton(
            child: Text('修改源码，添加使用 Flutter 的 cupertino 转场动画'),
            onPressed: () {
              NavigatorUtils.gotransitionCupertinoDemoPage(
                  context,
                  FluroConvertUtils.fluroCnParamsEncode(
                      "修改源码，添加使用 Flutter 的 cupertino 转场动画"));
            },
          ),
        ],
      ),
    );
  }

  /// 显示一个Dialgo
  void showResultDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
          title: new Text(
            "Hey Hey!",
            style: new TextStyle(
              color: const Color(0xFF00D6F7),
              fontFamily: "Lazer84",
              fontSize: 22.0,
            ),
          ),
          content: new Text("$message"),
          actions: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: new Text("OK"),
              ),
            ),
          ],
        );
      },
    );
  }
}
