import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/component/my_colros.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (context) => const MainScreen(),));
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
