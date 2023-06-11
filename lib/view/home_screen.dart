import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colros.dart';
import 'package:techblog/my_strings.dart';

import '../models/fake_data.dart';
import '../my_componnent.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.marginBody,
    required this.size,
    required this.themeData,
  });

  final double marginBody;
  final Size size;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          ),
          HomePagePoster(marginBody: marginBody, size: size, themeData: themeData),
          const SizedBox(
            height: 16,
          ),
          HomePageTagList(marginBody: marginBody, themeData: themeData),
          SeeMoreBLogList(marginBody: marginBody, size: size, themeData: themeData),
          HomePageBlogList(size: size, marginBody: marginBody, themeData: themeData),
          SeeMorePodcasts(marginBody: marginBody, size: size, themeData: themeData),
          HomePagePodcastsList(size: size, marginBody: marginBody),
          const SizedBox(height: 60,)
        ],
      ),
    );
  }
}

class HomePagePodcastsList extends StatelessWidget {
  const HomePagePodcastsList({
    super.key,
    required this.size,
    required this.marginBody,
  });

  final Size size;
  final double marginBody;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: blogList.getRange(0, 10).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? marginBody : 20),
                child: SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.2,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  blogList[index].imageUrl),
                              fit: BoxFit.cover),
                        ),
                        foregroundDecoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? marginBody : 15),
                child: SizedBox(
                    width: size.width / 2.2,
                    child: Center(
                      child: Text(blogList[index].date),
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}

class SeeMorePodcasts extends StatelessWidget {
  const SeeMorePodcasts({
    super.key,
    required this.marginBody,
    required this.size,
    required this.themeData,
  });

  final double marginBody;
  final Size size;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: marginBody, top: 16, bottom: 10),
      child: Row(
        children: [
          Assets.icon.micro.image(
              height: size.height / 37, color: SolidColor.seeMore),
          const SizedBox(
            width: 10,
          ),
          Text(
            MyStrings.viewHotestPodCasts,
            style: themeData.displaySmall,
          )
        ],
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
    required this.marginBody,
    required this.themeData,
  });

  final Size size;
  final double marginBody;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: blogList.getRange(0, 10).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? marginBody : 20),
                child: SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.2,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  blogList[index].imageUrl),
                              fit: BoxFit.cover),
                        ),
                        foregroundDecoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                end: Alignment.center,
                                begin: Alignment.bottomCenter,
                                colors: GradientColors.blogList)),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: themeData.titleMedium,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(blogList[index].views,
                                        style: themeData.titleMedium),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? marginBody : 15),
                child: SizedBox(
                    width: size.width / 2.2,
                    child: Text(
                      blogList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}

class SeeMoreBLogList extends StatelessWidget {
  const SeeMoreBLogList({
    super.key,
    required this.marginBody,
    required this.size,
    required this.themeData,
  });

  final double marginBody;
  final Size size;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: marginBody, top: 16, bottom: 10),
      child: Row(
        children: [
          Assets.icon.pen.image(
              height: size.height / 37, color: SolidColor.seeMore),
          const SizedBox(
            width: 10,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: themeData.displaySmall,
          )
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.marginBody,
    required this.themeData,
  });

  final double marginBody;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                0, 8, index == 0 ? marginBody : 15, 0),
            child: MainTags(themeData: themeData,index:index ,),
          );
        },
      ),
    );
  }
}


class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.marginBody,
    required this.size,
    required this.themeData,
  });

  final double marginBody;
  final Size size;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: marginBody),
          child: Container(
            height: size.height / 4.2,
            width: size.width / 1.20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Assets.img.posterTest.image().image),
              gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: GradientColors.homePosterGradient),
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: GradientColors.homePosterGradient),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePosterData["writer"] +
                        " - " +
                        homePosterData["date"],
                    style: themeData.titleMedium,
                  ),
                  Row(
                    children: [
                      Text(homePosterData["view"],
                          style: themeData.titleMedium),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                        size: 17,
                      ),
                    ],
                  )
                ],
              ),
              Center(
                child: Text(
                  homePosterData["titile"],
                  style: themeData.displayLarge,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
