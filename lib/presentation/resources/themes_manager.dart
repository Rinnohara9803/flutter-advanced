import 'package:flutter/material.dart';
import 'package:flutteradvanced/presentation/resources/colors_manager.dart';

import 'fonts_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // application theme
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.primaryOpacity70,
    primaryColorDark: AppColors.darkPrimary,
    accentColor: AppColors.grey,
    disabledColor: AppColors.grey1,
    splashColor: AppColors.primaryOpacity70,

    // card view theme

    cardTheme: CardTheme(
      color: AppColors.white,
      shadowColor: AppColors.grey,
      elevation: AppSize.s4,
    ),

    // appbar theme

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.primary,
      elevation: AppSize.s4,
      shadowColor: AppColors.primaryOpacity70,
      titleTextStyle: getRegularTextStyle(
        color: AppColors.white,
        fontSize: FontSize.s16,
      ),
    ),

    // button theme

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: AppColors.grey1,
      buttonColor: AppColors.primary,
      splashColor: AppColors.primaryOpacity70,
    ),

    // elevated button theme

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularTextStyle(
          color: AppColors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
    ),

    // text theme

    textTheme: TextTheme(
        displayLarge: getSemiBoldTextStyle(
            color: AppColors.darkGrey, fontSize: FontSize.s16),
        displayMedium: getMediumTextStyle(
            color: AppColors.lightGrey, fontSize: FontSize.s14),
        displaySmall: getRegularTextStyle(color: AppColors.grey1),
        bodyLarge: getRegularTextStyle(
          color: AppColors.grey,
        )),

    // input decoration theme

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(
        AppPadding.p8,
      ),
      hintStyle: getRegularTextStyle(
        color: AppColors.grey1,
      ),
      labelStyle: getMediumTextStyle(
        color: AppColors.darkGrey,
      ),
      errorStyle: getRegularTextStyle(
        color: AppColors.error,
      ),

      // enabled border

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),

      // focused border

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),

      // error border

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.error,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),

      // focused-error border

      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
    ),
  );
}
