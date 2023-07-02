import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/component/my_colros.dart';
import 'package:techblog/view/splash_screen.dart';

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
    var themeData = Theme.of(context).textTheme;
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
          inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2)
          ),
          
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) {
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
        ),
        home: const SplashScreen());
  }
}
