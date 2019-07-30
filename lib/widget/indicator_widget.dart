import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  final List<String> imgUrlList;
  final PageController controller;
  final ValueChanged<int> onPageChanged;
  final int pageIndex;
  final double height;

  IndicatorWidget({
    this.imgUrlList,
    this.controller,
    this.onPageChanged,
    this.pageIndex,
    this.height = 200
  }) {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        height: height,
        child: new Stack(alignment: Alignment.bottomCenter, children: <Widget>[
          PageView(
              controller: controller,
              children: imgUrlList.map((item) => buildPageItem(imgUrlList.indexOf(item), item)).toList(),
              onPageChanged: onPageChanged
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: imgUrlList.map((item) => buildDotItem(imgUrlList.indexOf(item))).toList()),
        ])
    );
  }

  Widget buildPageItem(int index, String imgUrl) {
    return ConstrainedBox(
      child: new Image.asset(
        imgUrl,
        fit: BoxFit.fill,
      ),
      constraints: new BoxConstraints.expand(),
    );
  }

  Widget buildDotItem(int index) {
    return new Container(
        margin: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 20),
        width: 10,
        height: 10,
        decoration: BoxDecoration(shape: BoxShape.circle, color: (pageIndex == index) ? Colors.grey : Colors.black12));
  }

}