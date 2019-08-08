import 'package:flutter/material.dart'; // ui库
import 'bottom_navigation.dart';
import 'package:dio/dio.dart';
// 入口文件
void main() => runApp(MyApp());
// 继承不动的组件
class MyApp extends StatelessWidget{
  // 方法重写
  @override
  Widget build(BuildContext context) {
    // 抛出组件方法
    getHttp().then((info){
      print(info);
    });
    print(222);
    return MaterialApp(
      title: 'buqiancheng',
      theme: ThemeData.light(),
      home: BottomNavigator(),
      
    );
  }
   Future getHttp() async{
    try{
      Response response;
      response = await Dio().get("http://192.168.1.3:8080/api/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a");
      return response;
    }catch(e) {
      return print(e);
    }
  }
}
