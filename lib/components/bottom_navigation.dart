import 'package:flutter/material.dart'; // ui库

class BottomNavigator extends StatefulWidget {
  BottomNavigator({Key key}) : super(key: key);

  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final _bottomColor = Colors.blue;
  TextEditingController typeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: _bottomColor),
          title: Text('Home', style: TextStyle(color: _bottomColor))),
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: _bottomColor),
          title: Text('Home', style: TextStyle(color: _bottomColor))),
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: _bottomColor),
          title: Text('Home', style: TextStyle(color: _bottomColor)))
    ]);
  }
}
