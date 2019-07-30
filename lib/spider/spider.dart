import 'dart:convert';

import 'package:http/http.dart' as http;


// 构造请求头
var header = {
  'user-agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36',
  'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
  'accept-language': 'zh',
  'content-type': 'text/html; charset=utf-8'
};

// 数据的请求
request(String url) async {
  var response = await http.get(url, headers: header);
  if (response.statusCode == 200) {
    return utf8.decode(response.bodyBytes);
  }
  return '<html>error! status:${response.statusCode}</html>';
}