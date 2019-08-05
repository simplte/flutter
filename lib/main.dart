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
        child:Container(
          child: new Text('卜前程', style:TextStyle(fontSize: 29.0)),
          alignment: Alignment.center,
          width: 300.0,
          height: 400.0,
          padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,10.0),
          margin: const EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.lightBlue,Colors.orange]
            ),
            border: Border.all(width: 5.0,color: Colors.orangeAccent)
          )
        )
      ),
      ),
    );
  }
}
