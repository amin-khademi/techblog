import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:techblog/component/my_componnent.dart';
import 'package:techblog/constant/my_colros.dart';
import 'package:techblog/constant/my_strings.dart';

import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';


class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context).textTheme;
    double marginBody = size.width / 10;
    return Scaffold(
      backgroundColor: SolidColor.scafoldBg,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: marginBody),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  Assets.img.sing,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  MyStrings.successfulRegistration,
                  style: themeData.headlineMedium,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی ",
                      hintStyle: themeData.headlineMedium),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  MyStrings.chooseCats,
                  style: themeData.headlineMedium,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                    itemCount: taghList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 5,
                            crossAxisCount: 2,
                            childAspectRatio: 0.3),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              if (!myCats.contains(taghList[index])) {
                                myCats.add(taghList[index]);
                              } else{}
                            });
                          },
                          child: MainTags(themeData: themeData, index: index));
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Assets.icon.downcat.image(scale: 3),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                    itemCount: myCats.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 3,
                            crossAxisSpacing: 5,
                            crossAxisCount: 2,
                            childAspectRatio: 0.3),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: SolidColor.surface),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                myCats[index].titile,
                                style: themeData.headlineMedium,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      myCats.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
