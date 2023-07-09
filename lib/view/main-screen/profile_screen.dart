import 'package:flutter/material.dart';
import 'package:techblog/component/my_colros.dart';
import 'package:techblog/component/my_componnent.dart';
import 'package:techblog/component/my_strings.dart';
import 'package:techblog/gen/assets.gen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context).textTheme;
    // double marginBody = size.width / 10;
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
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
              const SizedBox(height: 5,),
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
                    ),
            )));
  }
}
