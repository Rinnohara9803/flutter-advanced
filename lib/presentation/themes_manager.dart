import 'package:flutter/material.dart';
import 'package:flutteradvanced/presentation/colors_manager.dart';
import 'package:flutteradvanced/presentation/fonts_manager.dart';
import 'package:flutteradvanced/presentation/styles_manager.dart';
import 'package:flutteradvanced/presentation/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // application theme
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.primaryOpacity70,
    primaryColorDark: ColorsManager.darkPrimary,
    accentColor: ColorsManager.grey,
    disabledColor: ColorsManager.grey1,
    splashColor: ColorsManager.primaryOpacity70,

    // card view theme

    cardTheme: CardTheme(
      color: ColorsManager.white,
      shadowColor: ColorsManager.grey,
      elevation: AppSize.s4,
    ),

    // appbar theme

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorsManager.primaryOpacity70,
      titleTextStyle: getRegularTextStyle(
        color: ColorsManager.white,
        fontSize: FontSize.s16,
      ),
    ),

    // button theme

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorsManager.grey1,
      buttonColor: ColorsManager.primary,
      splashColor: ColorsManager.primaryOpacity70,
    ),

    // elevated button theme

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularTextStyle(
          color: ColorsManager.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
        ),
        backgroundColor: ColorsManager.primary,
      ),
    ),

    // text theme

    textTheme: TextTheme(
        displayLarge: getSemiBoldTextStyle(
            color: ColorsManager.darkGrey, fontSize: FontSize.s16),
        displayMedium: getMediumTextStyle(
            color: ColorsManager.lightGrey, fontSize: FontSize.s14),
        displaySmall: getRegularTextStyle(color: ColorsManager.grey1),
        bodyLarge: getRegularTextStyle(
          color: ColorsManager.grey,
        )),

    // input decoration theme
  );
}
