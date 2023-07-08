import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/services/dio_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController activeEditingController = TextEditingController();
  var email = "";
  var userID = "";

  register() async {
    Map<String, dynamic> map = {
      "email": emailEditingController.text,
      "command": "register",
    };
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    email = emailEditingController.text;
    userID = response.data["user_id"];

    print(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      "email": email,
      "user_id": userID,
      "code": activeEditingController.text,
      "command": "verify"
    };
    print(map);
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    print(response.data);
  }
}
