//TextStyle
import 'package:flutter/material.dart';
import 'package:ppildo/app/utils/app_colors.dart';

class AppTextStyle {
  //Bold Black
  static var bb30 = boldBlackTextStyle(30);
  static var bb28 = boldBlackTextStyle(28);
  static var bb24 = boldBlackTextStyle(24);
  static var bb22 = boldBlackTextStyle(22);
  static var bb20 = boldBlackTextStyle(20);
  static var bb18 = boldBlackTextStyle(18);
  static var bb16 = boldBlackTextStyle(16);
  static var bb14 = boldBlackTextStyle(14);
  static var bb12 = boldBlackTextStyle(12);
  static var bb10 = boldBlackTextStyle(10);
  //Normal black
  static var nb30 = normalBlackTextStyle(30);
  static var nb28 = normalBlackTextStyle(28);
  static var nb24 = normalBlackTextStyle(24);
  static var nb22 = normalBlackTextStyle(22);
  static var nb20 = normalBlackTextStyle(20);
  static var nb18 = normalBlackTextStyle(18);
  static var nb16 = normalBlackTextStyle(16);
  static var nb14 = normalBlackTextStyle(14);
  static var nb12 = normalBlackTextStyle(12);
  static var nb10 = normalBlackTextStyle(10);
  //Bold White
  static var bw30 = boldWhiteTextStyle(30);
  static var bw28 = boldWhiteTextStyle(28);
  static var bw24 = boldWhiteTextStyle(24);
  static var bw22 = boldWhiteTextStyle(22);
  static var bw20 = boldWhiteTextStyle(20);
  static var bw18 = boldWhiteTextStyle(18);
  static var bw16 = boldWhiteTextStyle(16);
  static var bw14 = boldWhiteTextStyle(14);
  static var bw12 = boldWhiteTextStyle(12);
  static var bw10 = boldWhiteTextStyle(10);
  //Normal White
  static var nw30 = normalWhiteTextStyle(30);
  static var nw28 = normalWhiteTextStyle(28);
  static var nw24 = normalWhiteTextStyle(24);
  static var nw22 = normalWhiteTextStyle(22);
  static var nw20 = normalWhiteTextStyle(20);
  static var nw18 = normalWhiteTextStyle(18);
  static var nw16 = normalWhiteTextStyle(16);
  static var nw14 = normalWhiteTextStyle(14);
  static var nw12 = normalWhiteTextStyle(12);
  static var nw10 = normalWhiteTextStyle(10);
}

/////
//Custom textStyle => Bold Black
TextStyle boldBlackTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );
}

//Custom textStyle => Normal black
TextStyle normalBlackTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );
}

//Custom textStyle => Bold White
TextStyle boldWhiteTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );
}

//Custom textStyle => Normal White
TextStyle normalWhiteTextStyle(double fontSize) {
  return TextStyle(
    fontSize: fontSize,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );
}
