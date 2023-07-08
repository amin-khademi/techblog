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
import 'package:techblog/models/article_info_model.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/view/article_list_screen.dart';

class Single extends StatefulWidget {
  Single({super.key});

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleArticleController.getArticleInfo();
  }

  @override
  Widget build(BuildContext context) {
    // var id=Get.arguments[0];
    var themeData = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        singleArticleController.articleInfoModel.value.image!,
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
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.bookmark_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                  Text(singleArticleController.articleInfoModel.value.author!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    singleArticleController.articleInfoModel.value.createdAt!,
                    style: themeData.caption,
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
              tags()
            ],
          ),
        ),
      ),
    ));
  }

  Widget tags() {
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
                padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? 15 : 15, 0),
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
