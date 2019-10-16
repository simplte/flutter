import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bqc/page/zhuanzhuan.dart';
import 'package:flutter_bqc/page/search.dart';
import 'package:flutter_bqc/page/splash_page.dart';

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
  return SearhPage();
});
