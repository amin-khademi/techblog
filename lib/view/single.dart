import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:techblog/component/my_colros.dart';
import 'package:techblog/component/my_componnent.dart';
import 'package:techblog/controller/list_article_controller.dart';
import 'package:techblog/controller/single_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/article_list_screen.dart';

// ignore: must_be_immutable
class Single extends StatelessWidget {
  var singleArticleController = Get.find<SingleArticleController>();

  Single({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double marginBody = size.width / 10;
    // var id=Get.arguments[0];
    var themeData = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => singleArticleController.articleInfoModel.value.title == null
            ? const Center(child: Loading())
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: singleArticleController
                              .articleInfoModel.value.image!,
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
                                    colors:
                                        GradientColors.singleAppBarGradient)),
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
                                const Icon(
                                  Icons.bookmark_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                      child: Text(
                        singleArticleController.articleInfoModel.value.title!,
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
                        Text(
                            singleArticleController
                                .articleInfoModel.value.author!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          singleArticleController
                              .articleInfoModel.value.createdAt!,
                          style: themeData.bodySmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      singleArticleController.articleInfoModel.value.content!,
                      style: themeData.headlineSmall,
                    ),
                    tags(size, marginBody),
                    const SizedBox(
                      height: 20,
                    ),
                    related(size, marginBody)
                  ],
                ),
              ),
      ),
    ));
  }

  SizedBox related(Size size, double marginBody) {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: singleArticleController.relatedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                singleArticleController.getArticleInfo(
                    singleArticleController.relatedList[index].id);
              },
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? marginBody : 20),
                    child: SizedBox(
                        height: size.height / 5.3,
                        width: size.width / 2.2,
                        child: CachedNetworkImage(
                          imageUrl:
                              singleArticleController.relatedList[index].image!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          ),
                          placeholder: (context, url) => const Loading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: Colors.grey,
                          ),
                        )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? marginBody : 15),
                    child: SizedBox(
                        width: size.width / 2.2,
                        child: Center(
                          child: Text(singleArticleController
                              .relatedList[index].title!),
                        )),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget tags(Size size, double marginBody) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: singleArticleController.tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              var tagId = singleArticleController.tagList[index].id!;
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
                          singleArticleController.tagList[index].title!,
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
