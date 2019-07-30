import 'package:json_annotation/json_annotation.dart';

part 'left_menu_model.g.dart';


@JsonSerializable()
class LeftMenuModel extends Object  {

  @JsonKey(name: 'data')
  List<Data> data;

  LeftMenuModel(this.data,);

  factory LeftMenuModel.fromJson(Map<String, dynamic> srcJson) => _$LeftMenuModelFromJson(srcJson);

}


@JsonSerializable()
class Data extends Object  {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'href')
  String href;

  @JsonKey(name: 'menus')
  List<Menus> menus;

  Data(this.title,this.href,this.menus,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

}


@JsonSerializable()
class Menus extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'href')
  String href;

  Menus(this.title,this.href,);

  factory Menus.fromJson(Map<String, dynamic> srcJson) => _$MenusFromJson(srcJson);

}


