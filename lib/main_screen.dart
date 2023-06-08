import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_colros.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context).textTheme;
    double marginBody = size.width / 10;
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
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                                size: 17,
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        homePosterData["titile"],
                        style: themeData.displayLarge,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: taghList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.fromLTRB(0, 8,index==0?marginBody:15, 0),
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
            )
          ],
        ),
      ),
    );
  }
}
