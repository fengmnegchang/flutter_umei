import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_umei/homepage/home_grid_widget.dart';
import 'package:flutter_umei/mock/home/mock_home.dart';
import 'package:flutter_umei/model/home/home_model.dart';
import 'package:flutter_umei/widget/indicator_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var imgUrlList = ['images/inditator0.jpg', 'images/inditator1.jpg', 'images/inditator2.jpg'];

  PageController _pageController = new PageController();
  int _pageIndex = 0;
  HomeModel _HomeModel;

  _HomePageState() {
    _HomeModel = HomeModel.fromJson(json.decode(MOCK_HOME_PAGE));
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
        children: _buildList()
    );
  }

  List<Widget> _buildList() {
    List<Widget> list = new List();
    list.add(new IndicatorWidget(imgUrlList: imgUrlList, controller: _pageController, pageIndex: _pageIndex, onPageChanged: (index) {
      setState(() {
        _pageIndex = index;
      });
    }));
    for (int i = 0; i < _HomeModel.data.length; i++) {
      print("_buildList i==" + i.toString());
      Data data = _HomeModel.data[i];
      list.add(_buildItem(data.title));
      list.add(new HomeGridWidget(
          crossAxisCount: 2,
          rows: (data.images.length / 2).toInt(),
          datas: data.images,
          isImage: data.isImage,
          callback: (s, b) {

          }));
    }
    return list;
  }


  Widget _buildItem(String title) {
    return new GestureDetector(
        onTap: () {
          //todo
        },
        child: new Padding(
          padding: EdgeInsets.all(5),
          child: Row(children: <Widget>[
            new Text("|",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff1f92d1),
                )),
            new SizedBox(width: 8),
            new Text(title,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff1f92d1),
                )),
          ]),
        ));
  }

}