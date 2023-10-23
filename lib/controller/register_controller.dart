import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/constant/my_strings.dart';
import 'package:techblog/constant/storage_const.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/rout_manager/names.dart';
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
    var response =
        await DioService().postMethod(map, ApiUrlconstant.postRegister);
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
    var response =
        await DioService().postMethod(map, ApiUrlconstant.postRegister);
    debugPrint(response.data.toString());
    var status = response.data["response"];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(StorageKey.token, response.data["token"]);
        box.write(StorageKey.userId, response.data["user_id"]);

        debugPrint("read: ${box.read(StorageKey.token)}");
        debugPrint("read: ${box.read(StorageKey.userId)}");

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
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(RegisterIntro());
    } else {
      debugPrint("post Screen");
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.img.sing,
                  height: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(MyStrings.shareKnowledge)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(MyStrings.gigTech),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint("write article");
                    Get.toNamed(NamedRout.routeManageArticle);
                  },
                  child: Container(
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Assets.icon.writeArticleIcon.image(height: 32),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(MyStrings.titleAppBarManageArticle)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint("upload podcast");
                  },
                  child: Container(
                    height: 50,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Assets.icon.writeMicrophone.image(height: 32),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(MyStrings.managePodcast)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
