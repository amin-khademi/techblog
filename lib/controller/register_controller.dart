import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/component/storage_const.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/main-screen/main_screen.dart';

class RegisterController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController activeEditingController = TextEditingController();
  var email = "";
  var user_id = "";

  register() async {
    Map<String, dynamic> map = {
      "email": emailEditingController.text,
      "command": "register",
    };
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    email = emailEditingController.text;
    user_id = response.data["user_id"];

    print(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      "email": email,
      "user_id": user_id,
      "code": activeEditingController.text,
      "command": "verify"
    };
    print(map);
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    print(response.data);

    if (response.data["response"] == "verified") {
      var box = GetStorage();
      box.write(token, response.data["token"]);
      box.write(user_id, response.data["user_id"]);

      print("read:" + box.read(token));
      print("read:" + box.read(user_id));

      Get.to(MainScreen());
    } else {
      print("error");
    }
  }
}
