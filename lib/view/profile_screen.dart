import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colros.dart';
import 'package:techblog/my_componnent.dart';
import 'package:techblog/my_strings.dart';

import '../models/fake_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
            child: Column(
          children: [
            
            Assets.img.profileImg.image(height: size.height / 7),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icon.pen.image(height: size.height / 37),
                const SizedBox(
                  width: 8,
                ),
                Text(MyStrings.imageProfileEdit, style: themeData.displaySmall)
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "فاطمه امیری",
              style: themeData.headlineMedium,
            ),
            SizedBox(height: 5,),
            Text(
              "fatemeamiri@gmail.com",
              style: themeData.headlineMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            TechDivider(size: size),
            SizedBox(width: size.width/1.5,
              child: InkWell(borderRadius: BorderRadius.circular(10),splashColor: SolidColor.pimaryColor.withOpacity(0.5),
                  onTap: () {},
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        MyStrings.myFavBlog,
                        style: themeData.headlineMedium,
                      ),
                    ),
                  )),
            ),
            TechDivider(size: size),
            SizedBox(width: size.width/1.5,
              child: InkWell(borderRadius: BorderRadius.circular(10),splashColor: SolidColor.pimaryColor.withOpacity(0.5),
                  onTap: () {},
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        MyStrings.myFavPodcast,
                        style: themeData.headlineMedium,
                      ),
                    ),
                  )),
            ),
            TechDivider(size: size),
            SizedBox(
              width: size.width/1.5,
              child: InkWell(borderRadius: BorderRadius.circular(10),splashColor: SolidColor.pimaryColor.withOpacity(0.5),
                  onTap: () {},
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        MyStrings.logOut,
                        style: themeData.headlineMedium,
                      ),
                    ),
                  )),
            ),
                const SizedBox(height: 60,)
          ],
        )));
  }
}
