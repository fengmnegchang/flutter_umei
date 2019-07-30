import 'package:flutter/material.dart';
import 'package:flutter_umei/model/menu/left_menu_model.dart';
 typedef GridViewCallback = void Function(String s,String b);

class MenuGridWidget extends StatelessWidget {
  final int crossAxisCount;
  final List<Menus> datas;
  final int rows;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final GridViewCallback callback;
  final Alignment alignment;

  MenuGridWidget({
    this.crossAxisCount = 3,
    this.rows,
    this.datas,
    this.textStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xff333333),
    ),
    this.padding = const EdgeInsets.all(5),
    this.callback,
    this.alignment = Alignment.topLeft
  }) {

  }

  @override
  Widget build(BuildContext context) {
    return new Column(children: _buildColumn(),);
  }

  List<Widget> _buildColumn() {
    List<Widget> list = new List();
    print("_buildGrid size==" + rows.toString());

    //demo 11/3=3;first for data 0-9
    for (int i = 0; i < rows; i++) {
      print("_buildGrid i==" + i.toString());
      List<Widget> listRow = new List();

      for (int j = 0; j < crossAxisCount; j++) {
        Widget _widget = _buildExpanded(i * crossAxisCount + j);
        if (_widget != null) {
          listRow.add(_widget);
        }
      }

      list.add(new Row(
          children: listRow
      ));
    }

    //demo second for data 10-11
    List<Widget> listRow = new List();
    for (int i = crossAxisCount * rows; i < datas.length; i++) {
      print("_buildGrid 3*size==" + i.toString());
      Widget _widget = _buildExpanded(i);
      if (_widget != null) {
        listRow.add(_widget);
      }
    }


    //demo last for data 11-12
    for (int i = datas.length; i < crossAxisCount * rows + crossAxisCount; i++) {
      print("_buildGrid data*length==" + i.toString());
      listRow.add(Expanded(
          flex: 1,
          child: new Text(" ")));
    }

    list.add(new Row(
        children: listRow
    ));
    return list;
  }

  Widget _buildExpanded(int i) {
    if (datas.length >= i) {
      Menus menus = datas[i];
      if (menus != null) {
        return Expanded(
          flex: 1,
          child: new GestureDetector(
              onTap: () {
                //todo
                callback(menus.title,menus.href);
              },
              child: new Container(
                alignment: alignment,
                padding: padding,
                child: new Text(menus.title,
                    style: textStyle),
              )
          ),
        );
      } else {
        return Expanded(
            flex: 1,
            child: new Text(" "));
      }
    }
  }


}