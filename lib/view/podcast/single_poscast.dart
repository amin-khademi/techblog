import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:techblog/component/decorations.dart';
import 'package:techblog/component/dimens.dart';
import '../../component/my_componnent.dart';
import '../../constant/my_colros.dart';
import '../../gen/assets.gen.dart';

class SinglePodcast extends StatelessWidget {
  const SinglePodcast({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://techblog.sasansafari.com/Techblog/assets/upload/images/article/20220904181457.jpg",
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
                  padding: const EdgeInsets.fromLTRB(8, 8, 32, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "عنوان پادکست",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.img.profileImg.path,
                        width: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("امین خادمی",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ImageIcon(
                                  Image.asset(Assets.icon.micro.path).image,
                                  color: SolidColor.seeMore,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  "بخش چهارم : فریلنسر دیونه",
                                ),
                              ],
                            ),
                            Text("22:00")
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 8,
            right: Dimens.marginBody,
            left: Dimens.marginBody,
            child: Container(
              height: Get.height / 10,
              decoration: MyDecoration.maingradient,
            ))
      ],
    )));
  }
}
