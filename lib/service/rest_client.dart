import 'package:flutter_umei/service/http_get.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'rest_client.g.dart';


@RestApi(baseUrl: "https://news-at.zhihu.com/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("api/4/version/android/2.6.0")
  Future<HttpGet> version();
}

