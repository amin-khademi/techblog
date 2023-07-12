import 'package:flutter/material.dart';

import '../constant/my_colros.dart';

class MyDecoration {
  MyDecoration._();

  static BoxDecoration maingradient = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(18),
    ),
    gradient: LinearGradient(colors: GradientColors.bottomNavigation),
  );
}
