import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/my_colros.dart';
import 'package:techblog/splash_screen.dart';

void main() {
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
    const defaultTextStyle = TextStyle(fontFamily: "IranYekan");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa'), // farsi
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
              displayLarge: TextStyle(
                  //? headline1
                  fontFamily: defaultTextStyle.fontFamily,
                  fontSize: 16,
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
                  color: SolidColor.posterSubTitle),
                  bodyLarge:TextStyle(
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
                  color: SolidColor.posterSubTitle) ),
          
        ),
        home: const SplashScreen());
  }
}
