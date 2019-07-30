// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'left_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeftMenuModel _$LeftMenuModelFromJson(Map<String, dynamic> json) {
  return LeftMenuModel((json['data'] as List)
      ?.map((e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$LeftMenuModelToJson(LeftMenuModel instance) =>
    <String, dynamic>{'data': _$ListDataToJson(instance.data)};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['title'] as String,
      json['href'] as String,
      (json['menus'] as List)
          ?.map((e) =>
              e == null ? null : Menus.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

List<dynamic> _$ListDataToJson(List<Data> instance) {
  List list = new List();
  for (var o in instance) {
    list.add(_$DataToJson(o));
  }
  return list;
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'title': instance.title,
      'href': instance.href,
      'menus': _$ListMenusToJson(instance.menus)
    };

Menus _$MenusFromJson(Map<String, dynamic> json) {
  return Menus(json['title'] as String, json['href'] as String);
}

List<dynamic> _$ListMenusToJson(List<Menus> instance) {
  List list = new List();
  for (var o in instance) {
    list.add(_$MenusToJson(o));
  }
  return list;
}

Map<String, dynamic> _$MenusToJson(Menus instance) =>
    <String, dynamic>{'title': instance.title, 'href': instance.href};
