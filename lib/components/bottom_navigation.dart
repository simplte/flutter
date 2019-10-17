import 'package:flutter/material.dart'; // ui库
import 'package:flutter_bqc/page/search.dart';

class BottomNavigator extends StatefulWidget {
  BottomNavigator({Key key}) : super(key: key);

  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final _bottomColor = Colors.blue;
  TextEditingController typeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电影列表'),
      ),
      body: SearhPage(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _bottomColor),
            title: Text('Home', style: TextStyle(color: _bottomColor))),
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _bottomColor),
            title: Text('Home', style: TextStyle(color: _bottomColor))),
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _bottomColor),
            title: Text('Home', style: TextStyle(color: _bottomColor)))
      ]),
    );
  }
}
