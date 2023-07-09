import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/component/storage_const.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/main-screen/main_screen.dart';
import 'package:techblog/view/register/register_intro.dart';

class RegisterController extends GetxController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController activeEditingController = TextEditingController();
  var email = "";
  var userId = "";

  register() async {
    Map<String, dynamic> map = {
      "email": emailEditingController.text,
      "command": "register",
    };
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    email = emailEditingController.text;
    userId = response.data["user_id"];

    debugPrint(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      "email": email,
      "user_id": userId,
      "code": activeEditingController.text,
      "command": "verify"
    };
    debugPrint(map.toString());
    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    debugPrint(response.data.toString());
    var status = response.data["response"];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data["token"]);
        box.write(userId, response.data["user_id"]);

        debugPrint("read: ${box.read(token)}");
        debugPrint("read: ${box.read(userId)}");

        Get.offAll(MainScreen());
        break;
      case "incorrect_code":
        Get.snackbar("خطا", "کد فعال سازی غلط است  ");
        break;
      case "expired":
        Get.snackbar("خطا", "کد فعال سازی منقضی شده است.");
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(token) == null) {
      Get.to(RegisterIntro());
    } else {
      debugPrint("post Screen");
    }
  }
}
