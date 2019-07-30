import 'package:flutter_umei/model/menu/left_menu_model.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';
import 'dart:convert';
import 'package:flutter_umei/spider/spider.dart';

/***
 * <div n="nav" class="nav">
    <dl>
    <dt><a href="http://m.umei.cc/bizhitupian/">壁纸图片</a></dt>

    <dd><a href="http://m.umei.cc/bizhitupian/diannaobizhi/">电脑壁纸</a></dd>

    <dd><a href="http://m.umei.cc/bizhitupian/shoujibizhi/">手机壁纸</a></dd>

    <dd><a href="http://m.umei.cc/bizhitupian/dongtaibizhi/">动态壁纸</a></dd>

    <dd><a href="http://m.umei.cc/bizhitupian/huyanbizhi/">护眼壁纸</a></dd>

    <dd><a href="http://m.umei.cc/bizhitupian/meinvbizhi/">美女壁纸</a></dd>

    <dd><a href="http://m.umei.cc/bizhitupian/xiaoqingxinbizhi/">小清新壁纸</a></dd>

    <dd><a href="http://m.umei.cc/bizhitupian/weimeibizhi/">唯美壁纸</a></dd>

    <dd><a href="http://m.umei.cc/bizhitupian/fengjingbizhi/">风景壁纸</a></dd>

    <dd><a href="http://m.umei.cc/bizhitupian/keaibizhi/">可爱壁纸</a></dd>

    </dl><dl>
 */
// 数据的解析
parseMenu() async {
  var html = await request("http://m.umei.cc/");
  Document document = parse(html);
  // 这里使用css选择器语法提取数据
  List<Element> dls = document.querySelectorAll('div.nav > dl');
  List<Data> list = new List();
  if (dls.isNotEmpty) {
    list = List.generate(dls.length, (i) {
      String href;
      String title;

      //dt
      List<Element> dts = dls[i].querySelectorAll('dt > a');
      if (dts.isNotEmpty) {
        href = dts[0].attributes['href'];
        title = dts[0].text;
      }

      //dd
      List<Element> dds = dls[i].querySelectorAll('dd > a');
      List<Menus> menus = new List();
      if (dds.isNotEmpty) {
        menus = List.generate(dds.length, (j) {
          return Menus(dds[j].text, dds[j].attributes['href']);
        });
      }
      return new Data(title, href, menus);
    });
  }
  LeftMenuModel leftMenuModel = new LeftMenuModel(list);
  return leftMenuModel;
}

// 数据的储存
void getMenu() async {
  LeftMenuModel data = await parseMenu();
  String dataStr = json.encode(data.toJson(data));
  print("dataStr===" + dataStr);
}