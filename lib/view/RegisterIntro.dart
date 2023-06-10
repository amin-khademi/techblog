import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/my_colros.dart';
import 'package:techblog/my_strings.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeData = Theme.of(context).textTheme;
    double marginBody = size.width / 10;
    return SafeArea(
      child: Scaffold(
        backgroundColor: SolidColor.scafoldBg,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SvgPicture.asset(
              Assets.img.sing,
              height: 100,
            )),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.welcom, style: themeData.headlineMedium),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: () {},
                child:  Text(
                  "بزن بریم",
                ),
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return themeData.titleLarge;
                  }
                  return themeData.bodyMedium;
                }), backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return SolidColor.seeMore;
                  }
                  return SolidColor.pimaryColor;
                })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
