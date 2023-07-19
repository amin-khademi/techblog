import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/component/test_style.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/my_colros.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.7,
      color: SolidColor.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags({
    super.key,
    required this.themeData,
    required this.index,
  });

  final TextTheme themeData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            const SizedBox(
              width: 8,
            ),
            Text(
              Get.find<HomeScreenController>().tagList[index].title!,
              style: themeData.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    // ignore: unnecessary_brace_in_string_interps
    debugPrint("cant find ${uri}");
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColor.pimaryColor,
      size: 32,
    );
  }
}

PreferredSize appBar(String titile) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
                child: Text(
              titile,
              style: appBarTextStyle,
            )),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: SolidColor.pimaryColor.withBlue(100),
              ),
              child: const Icon(Icons.chevron_left_rounded),
            ),
          ),
        ),
      ),
    ),
  );
}

class SeeMoreBLogList extends StatelessWidget {
  const SeeMoreBLogList({
    super.key,
    required this.marginBody,
    required this.size,
    required this.themeData,
    required this.title,
  });

  final double marginBody;
  final Size size;
  final TextTheme themeData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: marginBody, top: 16, bottom: 10),
      child: Row(
        children: [
          Assets.icon.pen
              .image(height: size.height / 37, color: SolidColor.seeMore),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: themeData.displaySmall,
          )
        ],
      ),
    );
  }
}
