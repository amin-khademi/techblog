import 'package:flutter/material.dart';

import '../constant/my_colros.dart';

class MyDecoration {
  MyDecoration._();

  static BoxDecoration maingradient = const BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
    gradient: LinearGradient(colors: GradientColors.bottomNavigation),
  );
}
