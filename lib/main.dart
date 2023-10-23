import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/theme.dart';
import 'package:techblog/constant/my_colros.dart';
import 'package:techblog/my_http_overrides.dart';
import 'package:techblog/rout_manager/names.dart';
import 'package:techblog/rout_manager/page.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColor.statusColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColor.navigationColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context).textTheme;
    const defaultTextStyle = TextStyle(fontFamily: "IranYekan");
    return GetMaterialApp(
      initialRoute: NamedRout.initialRoute,
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      locale: const Locale("fa"),
      title: 'Flutter Demo',
      theme: lightTheme(themeData, defaultTextStyle),
    );
  }
}
