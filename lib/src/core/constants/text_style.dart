import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/src/core/constants/colors.dart';

class FontWeightHelper {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

//
class AppTextStyles {
  // to calculate the height of the text use this ratio font height in design divided by font size

  //**  we write [font family],[size],[color],[opacity percentage],[font weight] and [font height]*/

  static TextStyle interFont24White100SemiBold1 = TextStyle(
    fontSize: 24.sp,
    fontFamily: 'inter',
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.white,
  );
  static TextStyle interFont20DeepBlue100Medium1 = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'inter',
    fontWeight: FontWeightHelper.medium,
    color: AppColor.deepBlue,
  );
  static TextStyle interFont20White100Medium1_1 = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'inter',
    fontWeight: FontWeightHelper.medium,
    color: AppColor.white,
    height: 1.1,
  );
  static TextStyle interFont20Red100Medium1_1 = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'inter',
    fontWeight: FontWeightHelper.medium,
    color: AppColor.red,
    height: 1.1,
  );

  static TextStyle interFont16White100Medium1 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'inter',
    fontWeight: FontWeightHelper.medium,
    color: AppColor.white,
  );
  static TextStyle interFont16Black100Medium1 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'inter',
    fontWeight: FontWeightHelper.medium,
    color: AppColor.black,
  );
  static TextStyle interFont20DeepBlue100regular1 = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'inter',
    fontWeight: FontWeightHelper.regular,
    color: AppColor.deepBlue,
  );
  static TextStyle interFont16DeepBlue100Regular1 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'inter',
    fontWeight: FontWeightHelper.regular,
    color: AppColor.deepBlue,
  );
  static TextStyle interFont96DeepBlue100ExtraBold1 = TextStyle(
    fontSize: 96.sp,
    fontFamily: 'inter',
    fontWeight: FontWeightHelper.extraBold,
    color: AppColor.deepBlue,
  );
}
