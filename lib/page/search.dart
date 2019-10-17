import 'package:flutter/material.dart'; // ui库
import 'package:flutter_bqc/config/navigator_util.dart';
import 'package:flutter_bqc/utils/fluro_convert_util.dart';
import 'package:flutter_bqc/utils/fluro_convert_util.dart';

class SearhPage extends StatefulWidget {
  final String name;
  final int age;
  final double score;
  final bool sex;
  SearhPage({this.name, this.age, this.score, this.sex});
  _SearhPageState createState() => _SearhPageState();
}

class _SearhPageState extends State<SearhPage> {
  final _bottomColor = Colors.blue;
  TextEditingController typeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    /// 对 中文 进行解码
    String mName = FluroConvertUtils.fluroCnParamsDecode(widget.name);
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
          Text('name：$mName'),
          Text('age：${widget.age}'),
          Text('score：${widget.score}'),
          Text('sex：${widget.sex}'),
          RaisedButton(
            child: Text('返回'),
            onPressed: () {
              NavigatorUtils.goBack(context);
            },
          )
        ],
      ),
    );
  }
}
