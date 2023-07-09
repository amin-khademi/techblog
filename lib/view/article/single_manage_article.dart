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
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/article/article_list_screen.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  var manageArticleController = Get.find<MangeArticleController>();

  SingleManageArticle({super.key});

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
                  CachedNetworkImage(
                    imageUrl:
                        manageArticleController.articleInfoModel.value.image!,
                    imageBuilder: (context, imageProvider) =>
                        Image(image: imageProvider),
                    placeholder: (context, url) => const Loading(),
                    errorWidget: (context, url, error) =>
                        Image.asset(Assets.img.singlePlaceHolder.path),
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
                        child: Container(
                          height: 30,
                          width: Get.width / 3,
                          decoration: const BoxDecoration(
                              color: SolidColor.pimaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(MyStrings.selectImage,style: themeData.displayMedium,),
                              const Icon(Icons.add,color: Colors.white,)

                            ],
                          ),
                        ),
                      ))
                ],
              ),SeeMoreBLogList(
                        marginBody: Dimens.marginBody,
                        size: size,
                        themeData: themeData, title: MyStrings.viewHotestBlog,),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                child: Text(
                  manageArticleController.articleInfoModel.value.title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.black, fontSize: 16),
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    Assets.img.profileImg.path,
                    width: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                manageArticleController.articleInfoModel.value.content!,
                style: themeData.headlineSmall,
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
