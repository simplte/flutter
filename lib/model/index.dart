import 'package:flutter/material.dart';
import 'package:flutter_bqc/model/model.dart';
// 引入provide状态管理包
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> PorviderList = [
  // 恒定值
  Provider.value(
    value: 11,
  ),
  //动态修改的值
  ChangeNotifierProvider(
    builder: (_) => Counter(1),
  ),
];
