import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colros.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

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
            Positioned.fill(
                child: IndexedStack(
              index: selectedPageIndex,
              children: [
            HomeScreen(
                marginBody: marginBody, size: size, themeData: themeData),
            ProfileScreen(
                marginBody: marginBody, size: size, themeData: themeData),
              ],
            )),
            BottomNavigation(
                changeScreen: (int value) {
                  setState(() {
                    selectedPageIndex = value;
                  });
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
        right: 0
        ,left: 0,
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
