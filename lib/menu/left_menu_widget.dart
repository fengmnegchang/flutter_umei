import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_umei/menu/menu_grid_widget.dart';
import 'package:flutter_umei/model/menu/left_menu_model.dart';
import 'package:flutter_umei/mock/menu/mock_menu.dart';

class LeftMenuWidget extends StatelessWidget {
  LeftMenuModel _LeftMenuModel;

  LeftMenuWidget() {
    _LeftMenuModel = LeftMenuModel.fromJson(json.decode(MOCK_MENU));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(16),
      child: new ListView(
        children: _buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> list = new List();
    for (int i = 0; i < _LeftMenuModel.data.length; i++) {
      print("_buildList i==" + i.toString());
      Data data = _LeftMenuModel.data[i];
      list.add(_buildItem(data.title, data.href));
      list.add(new MenuGridWidget(
          crossAxisCount: 3,
          rows: (data.menus.length / 3).toInt(),
          datas: data.menus,
          callback: (s, b) {

          }));
    }
    return list;
  }


  Widget _buildItem(String title, String href) {
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