import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constant/api_constant.dart';
import 'package:techblog/constant/comands.dart';
import 'package:techblog/constant/my_strings.dart';
import 'package:techblog/constant/storage_const.dart';
import 'package:techblog/controller/file_controller.dart';
import 'package:techblog/models/article_info_model.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class MangeArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<ArticleModel> tagList = RxList.empty();
  RxBool loading = false.obs;
  TextEditingController titeletextEditingController = TextEditingController();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
          MyStrings.titltArrticle, MyStrings.editOrginalTextArticle, "")
      .obs;

  @override
  onInit() {
    super.onInit();
    getMangeArticle();
  }

  getMangeArticle() async {
    loading.value = true;
    //TODO get userid from getstorage + userid

    // var response = await DioService().getMethod(
    //     ApiConstant.publishedByMe + GetStorage().read(StorageKey.userId));
    var response =
        await DioService().getMethod("${ApiUrlconstant.publishedByMe}2");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });
      articleList.clear();
      loading.value = false;
    }
  }

  updateTitle() {
    articleInfoModel.update((val) {
      val!.title = titeletextEditingController.text;
    });
  }

  storeArticle() async {
    var fileController = Get.find<FilePickerController>();
    loading.value = true;
    Map<String, dynamic> map = {
      ApiArticleKeyConstant.title: articleInfoModel.value.title,
      ApiArticleKeyConstant.content: articleInfoModel.value.content,
      ApiArticleKeyConstant.catId: articleInfoModel.value.catId,
      ApiArticleKeyConstant.userId: GetStorage().read(StorageKey.userId),
      ApiArticleKeyConstant.image:
          await dio.MultipartFile.fromFile(fileController.file.value.path!),
      ApiArticleKeyConstant.command: Commands.store,
      ApiArticleKeyConstant.tagList:"[]"
    };
    var response =
        await DioService().postMethod(map, ApiUrlconstant.articlePost);

    debugPrint(response.data.toString());
    loading.value = false;
  }
}
