import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bqc/utils/fluro_convert_util.dart';

import 'package:flutter_bqc/page/zhuanzhuan.dart';
import 'package:flutter_bqc/page/search.dart';
import 'package:flutter_bqc/page/splash_page.dart';
import 'package:flutter_bqc/page/home.dart';
import 'package:flutter_bqc/page/state_management_demo.dart';

var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return SplashWidget();
});
var zhuanHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return AnimPage();
});
var searchHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String name = params["name"]?.first;
  String age = params["age"]?.first;
  String sex = params["sex"]?.first;
  String score = params["score"]?.first;
  return SearhPage(
    name: name,
    age: FluroConvertUtils.string2int(age),
    score: FluroConvertUtils.string2double(score),
    sex: FluroConvertUtils.string2bool(sex),
  );
});
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return HomePage();
});
var stateManageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return StateManagementDemo();
});
