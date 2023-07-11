import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:techblog/component/dimens.dart';
import 'package:techblog/component/my_componnent.dart';
import 'package:techblog/constant/my_colros.dart';
import 'package:techblog/constant/my_strings.dart';
import 'package:techblog/controller/article/list_article_controller.dart';
import 'package:techblog/controller/article/mange_article_controller.dart';
import 'package:techblog/controller/file_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/services/pick_file.dart';
import 'package:techblog/view/article/article_list_screen.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  var manageArticleController = Get.find<MangeArticleController>();
  FilePickerController filePickerController = Get.put(FilePickerController());

  SingleManageArticle({super.key});

  getTitle() {
    Get.defaultDialog(
        title: MyStrings.titleDialogSingleManageArticle,
        titleStyle: const TextStyle(color: SolidColor.scafoldBg),
        content: TextField(
          controller: manageArticleController.titeletextEditingController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: SolidColor.titile,
          ),
          decoration: InputDecoration(
            hintText: "اینجا بنویس",
          ),
        ),
        backgroundColor: SolidColor.pimaryColor,
        radius: 8,
        confirm: ElevatedButton(
            onPressed: () {
              manageArticleController.updateTitle();
              Get.back();
            },
            child: Text(MyStrings.save)));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // var id=Get.arguments[0];
    var themeData = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height / 3,
                    child: filePickerController.file.value.name == "nothing"
                        ? CachedNetworkImage(
                            imageUrl: manageArticleController
                                .articleInfoModel.value.image!,
                            imageBuilder: (context, imageProvider) =>
                                Image(image: imageProvider),
                            placeholder: (context, url) => const Loading(),
                            errorWidget: (context, url, error) => Image.asset(
                              Assets.img.singlePlaceHolder.path,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.file(
                            File(filePickerController.file.value.path!),
                            fit: BoxFit.cover,
                            width: 200,
                          ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                              colors: GradientColors.singleAppBarGradient)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            //pic file
                            pickFiles();
                          },
                          child: Container(
                            height: 30,
                            width: Get.width / 3,
                            decoration: const BoxDecoration(
                                color: SolidColor.pimaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  MyStrings.selectImage,
                                  style: themeData.displayMedium,
                                ),
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  //get title
                  getTitle();
                },
                child: SeeMoreBLogList(
                  marginBody: Dimens.halfMarginBody,
                  size: size,
                  themeData: themeData,
                  title: MyStrings.editMainTextArticle,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Dimens.halfMarginBody),
                child: Text(
                  manageArticleController.articleInfoModel.value.title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.black, fontSize: 16),
                ),
              ),
              SeeMoreBLogList(
                marginBody: Dimens.halfMarginBody,
                size: size,
                themeData: themeData,
                title: MyStrings.editMainTextArticle,
              ),

              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(Dimens.halfMarginBody),
                child: Text(
                  manageArticleController.articleInfoModel.value.content!,
                  style: themeData.headlineSmall,
                ),
              ),
              SeeMoreBLogList(
                marginBody: Dimens.halfMarginBody,
                size: size,
                themeData: themeData,
                title: MyStrings.selectCategory,
              ),
              // tags(size, marginBody),
            ],
          ),
        ),
      ),
    ));
  }

  Widget tags(Size size, double marginBody) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: manageArticleController.tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              var tagId = manageArticleController.tagList[index].id!;
              await Get.find<ListArticleController>()
                  .getArticleListWithTagsId(tagId);
              Get.to(ArticleListScreen());
            },
            child: Padding(
                padding:
                    EdgeInsets.fromLTRB(0, 8, index == 0 ? marginBody : 15, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: GradientColors.tags),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Row(
                      children: [
                        Assets.icon.hash.image(height: 14),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          manageArticleController.tagList[index].title!,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
