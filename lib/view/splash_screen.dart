import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:techblog/component/my_colros.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Get.offAndToNamed(NamedRout.routeMainScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Assets.img.a1.image(height: 64)),
            const SizedBox(
              height: 30,
            ),
            const SpinKitFadingCube(
              color: SolidColor.pimaryColor,
              size: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
