import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';


@JsonSerializable()
class HomeModel extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  HomeModel(this.data,);

  factory HomeModel.fromJson(Map<String, dynamic> srcJson) => _$HomeModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'isImage')
  bool isImage;

  @JsonKey(name: 'images')
  List<Images> images;

  Data(this.title,this.isImage,this.images,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Images extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'href')
  String href;

  @JsonKey(name: 'img')
  String img;

  Images(this.title,this.href,this.img,);

  factory Images.fromJson(Map<String, dynamic> srcJson) => _$ImagesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

}


