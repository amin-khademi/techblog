import 'package:flutter/material.dart';
import 'package:techblog/constant/my_colros.dart';

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