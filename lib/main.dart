import 'package:flutter/material.dart'; // ui库
// 入口文件
void main() => runApp(MyApp());
// 继承不动的组件
class MyApp extends StatelessWidget{
  // 方法重写
  @override
  Widget build(BuildContext context) {
    // 抛出组件方法
    return MaterialApp(
      title: 'buqiancheng',
      home: Scaffold(
        appBar: AppBar(
          title: Text('卜前程的flutterg'),
      ),
      body: Center(
        child: Text(
          "你好fullter你好fullter你好fullter你好fullter你好fullter你好fullter你好fullter",
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
            fontSize:25.0, 
            color: Color.fromARGB(255, 255, 125, 125),
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
      ),
      ),
    );
  }
}
