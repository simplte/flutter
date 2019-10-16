import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bqc/application.dart';
import 'package:fluro/fluro.dart';

///打开APP首页
class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  bool showAd = true;

  @override
  Widget build(BuildContext context) {
    print('build splash');
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(0.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        '一重山叠万重关，一重关绕千里川',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        '山川似有游龙语，缠中说禅蝉说缠',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment(1.0, 0.0),
                    child: Container(
                      margin: const EdgeInsets.only(right: 30.0, top: 20.0),
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                      child: CountDownWidget(
                        onCountDownFinishCallBack: (bool value) {
                          if (value) {
                            setState(() {
                              showAd = false;
                            });
                          }
                        },
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffEDEDED),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'hi,man',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ],
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 6;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: TextStyle(fontSize: 17.0),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
    Application.router
        .navigateTo(context, "/zhuan", transition: TransitionType.inFromRight);
  }
}
