import 'dart:math';

import 'package:dio/dio.dart' as dio_service;
import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers["content-Type"] = "application/json";
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: "GET"))
        .then(
      (response) {
        print(response);
        return response;
      },
    );
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers["content-Type"] = "application/json";
    //TODO read token from storage

    return await dio
        .post(url,
            data:dio_service.FormData.fromMap(map), 
            options: Options(responseType: ResponseType.json, method: "POST"))
        .then((value) {
      print(value.headers.toString());
      print(value.data.toString());
      print(value.statusCode.toString());

      return value;
    });
  }
}
