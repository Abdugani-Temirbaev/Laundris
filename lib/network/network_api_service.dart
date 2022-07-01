import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:laundris/network/app_exception.dart';

class NetworkApiService {
  String get baseUrl => prodUrl;
  final String prodUrl = "https://m.kdb.uz:1880/api/";
  final String testUrl = "http://mbtest.kdb.uz:7777/api/";

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while communication with server with status code: ${response.statusCode}');
    }
  }

  Future fetchResponse(RequestType requestType, String url, Map<String, dynamic>? jsonBody) async {
    try {
      final uri = Uri.parse(baseUrl + url);
      http.Response response;
      /*print('''\n=====
        request: $uri
        body: $jsonBody
        headers: {
          ${HttpHeaders.authorizationHeader}: ${""}
        }
        =====\n''');*/
      switch (requestType) {
        case RequestType.post:
          response = await http.post(uri, body: jsonBody, headers: {HttpHeaders.authorizationHeader: ""});
          break;
        default:
          response = await http.get(uri, headers: {HttpHeaders.authorizationHeader: ""});
          break;
      }
      /*print('''\n=====
        response => ${response.statusCode} ${response.request}
        ${response.body}
        =====\n''');*/
      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }
}

enum RequestType { get, post }
