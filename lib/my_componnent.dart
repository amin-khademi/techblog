import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}
