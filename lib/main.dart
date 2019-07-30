import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_umei/drawer_menu_app.dart';

void main() {
  runApp(new WelcomeApp());
}

class WelcomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Timer _timer;
  int _seconds = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new DrawerMenuApp()));
        return;
      }
      _seconds--;
    });
  }


  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConstrainedBox(
          child: new Image.asset(
            "images/welcome.jpg",
            fit: BoxFit.fill,
          ),
          constraints: new BoxConstraints.expand(),
        ));
  }
}
