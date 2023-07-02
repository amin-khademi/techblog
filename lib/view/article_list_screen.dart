import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_componnent.dart';
import 'package:techblog/controller/article_controller.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    var texTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: appBar("مقالات جدید"),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: articleController.articleList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 3,
                        height: Get.height / 6,
                        child: CachedNetworkImage(
                          imageUrl: articleController.articleList[index].image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
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
                              articleController.articleList[index].title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(articleController.articleList[index].author!,
                                  style: texTheme.caption),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                articleController.articleList[index].view! +
                                    "بازدید",
                                style: texTheme.caption,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}
