import 'package:flutter/material.dart';
import 'package:techblog/component/my_componnent.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: appBar("مقالات جدید")));
  }


}
