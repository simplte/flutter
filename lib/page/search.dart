import 'package:flutter/material.dart'; // ui库
import './zhuanzhuan.dart';

class SearhPage extends StatefulWidget {
  SearhPage({Key key}) : super(key: key);

  _SearhPageState createState() => _SearhPageState();
}

class _SearhPageState extends State<SearhPage> {
  final _bottomColor = Colors.blue;
  TextEditingController typeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            controller: typeController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: '电影',
                helperText: '你喜欢的电影'),
          ),
        ],
      ),
    );
  }
}
