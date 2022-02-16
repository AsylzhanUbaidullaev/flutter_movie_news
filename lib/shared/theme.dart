import 'package:flutter/material.dart';
import 'package:flutter_movie_news/shared/size_config.dart';

class AppColors {
  AppColors._();

  static const Color appBarColor = Color(0xff253B49);
  static const Color starColor = Color(0xffE9C537);

  ///[_Primary Colors]
  static const Color primaryColor = Color(0xff0F2230);
  static const Color lightBlueColor = Color(0xffE7ECF1);

  ///[_Text Colors]
  static const Color blackColor = Color(0xff0A1929);
  static const Color darkGrayColor = Color(0xff686868);
  static const Color grayColor = Color(0xff999999);
  static const Color gray2Color = Color(0xffc4c4c4);
  static const Color inactiveColor = Color(0xffafb2b5);

  ///[_Background and Stroke colors]
  static const Color darkWhiteColor = Color(0xfffafafa);
  static const Color whiteColor = Color(0xffffffff);
  static const Color strokeColor = Color(0xffe4e4e4);
  //System Colors
  static const Color systemRedColor = Color(0xffe92626);
  static const Color systemGreenColor = Color(0xff4ac55c);
}

final BoxDecoration kAppBarDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Color(0xff000000).withOpacity(0.05),
      spreadRadius: 4,
      blurRadius: 16,
      offset: Offset(0.0, 0.75),
    ),
  ],
);

final BoxDecoration kPinPutDecoration = BoxDecoration(
  color: Color(0xffF8F8F8),
  borderRadius: BorderRadius.circular(8),
);

final TextStyle kLargeTitleTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(18),
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
  color: AppColors.whiteColor,
);

final BoxShadow kWhiteBoxshadow = BoxShadow(
  color: Color(0xff000000).withOpacity(0.05),
  spreadRadius: 2,
  blurRadius: 16,
);
