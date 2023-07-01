import 'package:flutter/material.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

import 'my_colros.dart';

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
              taghList[index].titile,
              style: themeData.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}