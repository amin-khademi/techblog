import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colros.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  Assets.img.a1.image(height: size.height / 13.6),
                  const Icon(Icons.search)
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: size.height / 4.2,
                  width: size.width / 1.20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image:DecorationImage(fit: BoxFit.cover ,image:Assets.img.posterTest.image().image),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: GradientColors.homePosterGradient),
                          ),
                ),
                Container(
                  height: size.height / 4.2,
                  width: size.width / 1.20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: GradientColors.homePosterGradient),
                          ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
