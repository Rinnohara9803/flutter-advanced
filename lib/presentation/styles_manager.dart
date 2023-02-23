import 'package:flutter/material.dart';
import 'package:flutteradvanced/presentation/fonts_manager.dart';

TextStyle _getTextStyle(
    Color color, FontWeight fontWeight, String fontFamily, double fontSize) {
  return TextStyle(
    color: color,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontSize: fontSize,
  );
}

// regular text-style

TextStyle getRegularTextStyle({fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      color, FontWeightManager.regular, FontConstants.fontFamily, fontSize);
}

// light text-style

TextStyle getLightTextStyle({fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      color, FontWeightManager.light, FontConstants.fontFamily, fontSize);
}

// bold text-style

TextStyle getBoldTextStyle({fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      color, FontWeightManager.bold, FontConstants.fontFamily, fontSize);
}

// semibold text-style

TextStyle getSemiBoldTextStyle(
    {fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      color, FontWeightManager.semiBold, FontConstants.fontFamily, fontSize);
}

// bold text-style

TextStyle getMediumTextStyle({fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      color, FontWeightManager.medium, FontConstants.fontFamily, fontSize);
}
