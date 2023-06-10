import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colros.dart';
import 'package:techblog/my_strings.dart';
import 'package:techblog/view/home_screen.dart';

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
            HomeScreen(marginBody: marginBody, size: size, themeData: themeData),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
            height: size.height / 12.3,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: GradientColors.bottomNavigationback)),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: marginBody),
              child: Container(
                height: size.height / 8,
                decoration: const BoxDecoration(
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

