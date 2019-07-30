// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel((json['data'] as List)
      ?.map((e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) =>
    <String, dynamic>{'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['title'] as String,
      json['isImage'] as bool,
      (json['images'] as List)
          ?.map((e) =>
              e == null ? null : Images.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'title': instance.title,
      'isImage': instance.isImage,
      'images': instance.images
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
      json['title'] as String,
      json['href'] as String,
      json['title2'] as String,
      json['href2'] as String,
      json['date'] as String,
      json['img'] as String);
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'title': instance.title,
      'href': instance.href,
      'title2': instance.title2,
      'href2': instance.href2,
      'date': instance.date,
      'img': instance.img
    };
