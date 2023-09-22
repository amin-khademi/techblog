import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
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

  ThemeData lightTheme(TextTheme themeData, TextStyle defaultTextStyle) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style:
            ButtonStyle(textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return themeData.titleLarge;
          }
          return themeData.bodyMedium;
        }), backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return SolidColor.seeMore;
          }
          return SolidColor.pimaryColor;
        })),
      ),
      textTheme: TextTheme(
          displayLarge: TextStyle(
              //? headline1
              fontFamily: defaultTextStyle.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColor.posterTitle),
          displayMedium: TextStyle(
              //? headline2
              fontFamily: defaultTextStyle.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColor.posterSubTitle),
          displaySmall: TextStyle(
              //? headline3
              fontFamily: defaultTextStyle.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColor.seeMore),
          headlineMedium: TextStyle(
              //? headline4
              fontFamily: defaultTextStyle.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColor.profileText),
          headlineSmall: TextStyle(
              //? headline5
              fontFamily: defaultTextStyle.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColor.hintTextColor),
          bodyLarge: TextStyle(
              //? bodytext1
              fontFamily: defaultTextStyle.fontFamily,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: SolidColor.posterSubTitle),
          titleMedium: TextStyle(
              //? subtitle1
              fontFamily: defaultTextStyle.fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColor.posterSubTitle)),
    );
  }
}
