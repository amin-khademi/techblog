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
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: size.height / 2,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Center(
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  MyStrings.insertYourEmail,
                                  style: themeData.headlineMedium,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                                  child: TextField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: "techBLog@gmail.com",
                                        hintStyle: themeData.headlineSmall),
                                  ),
                                ),
                                ElevatedButton(onPressed: () {
                                  
                                }, child: Text("ادامه"))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  "بزن بریم",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
