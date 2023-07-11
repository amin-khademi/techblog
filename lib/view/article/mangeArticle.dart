import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:techblog/component/my_componnent.dart';
import 'package:techblog/constant/my_colros.dart';
import 'package:techblog/constant/my_strings.dart';

import 'package:techblog/controller/article/mange_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});
  // RegisterController registerController = Get.put(RegisterController());
  var articleManagecontroller = Get.find<MangeArticleController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: appBar("مدریت مقاله"),
        backgroundColor: SolidColor.scafoldBg,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  fixedSize:
                      MaterialStateProperty.all(Size(Get.width / 3, 40))),
              onPressed: () {
                Get.toNamed(NamedRout.routeSingleManageArticle);
              },
              child: Text(
                MyStrings.textManageArticle,
              ),
            ),
          ),
        ),
        body: Obx(() => articleManagecontroller.loading.value
            ? const Loading()
            : articleManagecontroller.articleList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: articleManagecontroller.articleList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              //route single manage
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width / 3,
                                    height: Get.height / 6,
                                    child: CachedNetworkImage(
                                      imageUrl: articleManagecontroller
                                          .articleList[index].image!,
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16)),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover),
                                          ),
                                        );
                                      },
                                      placeholder: (context, url) {
                                        return const Loading();
                                      },
                                      errorWidget: (context, url, error) {
                                        return const Icon(
                                          Icons.image_not_supported_outlined,
                                          size: 50,
                                          color: Colors.grey,
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width / 2,
                                        child: Text(
                                          articleManagecontroller
                                              .articleList[index].title!,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              articleManagecontroller
                                                  .articleList[index].author!,
                                              style: themeData.bodySmall),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "${articleManagecontroller.articleList[index].view!}بازدید",
                                            style: themeData.bodySmall,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : articleEmptyState(themeData)),
      ),
    );
  }

  Column articleEmptyState(TextTheme themeData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: SvgPicture.asset(
          Assets.img.sing,
          height: 100,
        )),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: MyStrings.articleEmpty, style: themeData.headlineMedium),
          ),
        ),
      ],
    );
  }
}
