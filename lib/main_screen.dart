import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colros.dart';
import 'package:techblog/my_strings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context).textTheme;
    double marginBody = size.width / 10;
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColor.scafoldBg,
        appBar: AppBar(
          backgroundColor: SolidColor.scafoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Assets.img.a1.image(height: size.height / 13.6),
              const Icon(
                Icons.search,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  ),
                  Stack(
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
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: taghList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 8, index == 0 ? marginBody : 15, 0),
                          child: Container(
                            height: 30,
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
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    taghList[index].titile,
                                    style: themeData.displayMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
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
                  ),
                  SizedBox(
                    height: size.height / 3.5,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
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
                  ),
                  Padding(
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
                  ),
                  SizedBox(
                    height: size.height / 3.5,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
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
                  )
                ],
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
            height: size.height / 10,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: GradientColors.bottomNavigationback)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: size.height / 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    gradient:
                        LinearGradient(colors: GradientColors.bottomNavigation)),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                    
                    
                    IconButton(onPressed: () {}, icon: Assets.icon.user.image()),
                    IconButton(onPressed: () {}, icon: Assets.icon.w.image()),
                    IconButton(onPressed: () {}, icon: Assets.icon.icon.image()),
                    
                  ],
                ),
              ),
            ),
                  ),
          ),
          ],
        ),
        
      ),
    );
  }
}
