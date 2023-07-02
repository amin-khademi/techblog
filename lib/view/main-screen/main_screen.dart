import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/component/my_colros.dart';
import 'package:techblog/component/my_componnent.dart';
import 'package:techblog/component/my_strings.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/main-screen/home_screen.dart';
import 'package:techblog/view/main-screen/profile_screen.dart';


final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {


    
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context).textTheme;
    double marginBody = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColor.scafoldBg,
          child: Padding(
            padding: EdgeInsets.only(left: marginBody, right: marginBody),
            child: ListView(
              children: [
                DrawerHeader(child: Assets.img.a1.image(scale: 3)),
                ListTile(
                  title: Text(
                    "پروفایل کاربری",
                    style: themeData.headlineMedium,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColor.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "درباره تک‌ بلاگ",
                    style: themeData.headlineMedium,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColor.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: themeData.headlineMedium,
                  ),
                  onTap: () async {
                    await Share.share(MyStrings.shareText);
                  },
                ),
                const Divider(
                  color: SolidColor.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "تک‌ بلاگ در گیت هاب",
                    style: themeData.headlineMedium,
                  ),
                  onTap: () {
                    myLaunchUrl(MyStrings.techBlogGithubUrl);
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: SolidColor.scafoldBg,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SolidColor.scafoldBg,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: marginBody - 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (() {
                    _key.currentState!.openDrawer();
                  }),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                Assets.img.a1.image(height: size.height / 13.6),
                const Icon(
                  Icons.search,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Obx(() => IndexedStack(
                      index: selectedPageIndex.value,
                      children: [
                        HomeScreen(
                            marginBody: marginBody,
                            size: size,
                            themeData: themeData),
                        const ProfileScreen(),
                      ],
                    ))),
            BottomNavigation(
                changeScreen: (int value) {
                  selectedPageIndex.value = value;
                },
                size: size,
                marginBody: marginBody),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.marginBody,
    required this.changeScreen,
  });

  final Size size;
  final double marginBody;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: size.height / 11,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: GradientColors.bottomNavigationback)),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: marginBody),
            child: Container(
              height: size.height / 10,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  gradient:
                      LinearGradient(colors: GradientColors.bottomNavigation)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () => changeScreen(0),
                      icon: Assets.icon.icon.image(height: size.height / 28)),
                  IconButton(
                      onPressed: () {},
                      icon: Assets.icon.w.image(height: size.height / 28)),
                  IconButton(
                      onPressed: () => changeScreen(1),
                      icon: Assets.icon.user.image(height: size.height / 28)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
