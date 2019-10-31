import 'package:provider/provider.dart';
import 'package:flutter_bqc/providers/model.dart';

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
