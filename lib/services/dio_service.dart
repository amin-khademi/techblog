import 'package:dio/dio.dart' as dio_service;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constant/storage_const.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers["content-Type"] = "application/json";
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: "GET"))
        .then(
      (response) {
        debugPrint(response.toString());
        return response;
      },
    ).catchError((err) {
      if (err is DioError) {
        return err.response;
      }
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers["content-Type"] = "application/json";
    var token = GetStorage().read(StorageKey.token);
    if(
      token != null 
    ){dio.options.headers["authorization"] = "$token" ;}

    //TODO read token from storage

    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: "POST"))
        .then((response) {
      debugPrint(response.headers.toString());
      debugPrint(response.data.toString());
      debugPrint(response.statusCode.toString());

      return response;
    }).catchError((err) {
      if (err is DioError) {
        return err.response;
      }
    });
  }
}
