import 'package:flutter/material.dart';
import 'package:flutter_umei/home_page.dart';
import 'package:flutter_umei/menu/left_menu_widget.dart';
import 'package:flutter_umei/spider/menu_spider.dart';

class DrawerMenuApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawerMenuPage(),
    );
  }
}

class DrawerMenuPage extends StatefulWidget {
  DrawerMenuPage({Key key}) : super(key: key);

  @override
  _DrawerMenuPageState createState() => _DrawerMenuPageState();
}

class _DrawerMenuPageState extends State<DrawerMenuPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMenu();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
          title: new Text("优美高清图片手机版")
      ),
      body: new HomePage(),
      drawer: new Drawer(
        child: LeftMenuWidget(),
      ),
    );
  }
}