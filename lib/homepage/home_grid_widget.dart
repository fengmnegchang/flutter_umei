import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_umei/model/home/home_model.dart';
import 'package:transparent_image/transparent_image.dart';

typedef GridViewCallback = void Function(String s, String b);

class HomeGridWidget extends StatefulWidget {
  final int crossAxisCount;
  final List<Images> datas;
  final int rows;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final GridViewCallback callback;
  final Alignment alignment;
  final bool isImage;

  HomeGridWidget({
    this.crossAxisCount = 3,
    this.rows,
    this.datas,
    this.textStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xff333333),
    ),
    this.padding = const EdgeInsets.all(5),
    this.callback,
    this.alignment = Alignment.topLeft,
    this.isImage,
  }) {

  }

  @override
  _HomeGridState createState() => _HomeGridState();


}

class _HomeGridState extends State<HomeGridWidget> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: _buildColumn(),);
  }

  List<Widget> _buildColumn() {
    List<Widget> list = new List();
    print("_buildGrid size==" + widget.rows.toString());

    //demo 11/3=3;first for data 0-9
    for (int i = 0; i < widget.rows; i++) {
      print("_buildGrid i==" + i.toString());
      List<Widget> listRow = new List();

      for (int j = 0; j < widget.crossAxisCount; j++) {
        Widget _widget = _buildExpanded(i * widget.crossAxisCount + j);
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
    for (int i = widget.crossAxisCount * widget.rows; i < widget.datas.length; i++) {
      print("_buildGrid 3*size==" + i.toString());
      Widget _widget = _buildExpanded(i);
      if (_widget != null) {
        listRow.add(_widget);
      }
    }


    //demo last for data 11-12
    for (int i = widget.datas.length; i < widget.crossAxisCount * widget.rows + widget.crossAxisCount; i++) {
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
    if (widget.datas.length >= i) {
      Images menus = widget.datas[i];
      if (menus != null) {
        return Expanded(
          flex: 1,
          child: new GestureDetector(
              onTap: () {
                //todo
                widget.callback(menus.title, menus.href);
              },
              child: new Container(
                  alignment: widget.alignment,
                  padding: widget.padding,
                  child: widget.isImage == true ? _buildImage(menus) : _buildText(menus)
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

  Widget _buildImage(Images menus) {
    return new Column(
      children: <Widget>[
        new CachedNetworkImage(
          imageUrl: menus.img,
          placeholder: (context, url) => new CircularProgressIndicator(),
        ),
        new Text(menus.title,
            style: widget.textStyle)
      ],
    );
  }

  Widget _buildText(Images menus) {
    return new Column(
      children: <Widget>[
        new Text(menus.title,
            style: widget.textStyle)
      ],
    );
  }
}