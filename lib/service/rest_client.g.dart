// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
    _dio.options.baseUrl = 'https://news-at.zhihu.com/';
  }

  final Dio _dio;

  @override
  version() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    const _data = null;
    final _result = await _dio.request('api/4/version/android/2.6.0',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'GET', headers: {}, extra: _extra),
        data: _data);
    var value = HttpGet.fromJson(_result.data);
    return Future.value(value);
  }
}
