import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff03314B);
Color whiteColor = const Color(0xffFFFFFF);
Color blackColor = const Color(0xff000000);
Color disableColor = const Color(0xffC4C4C4);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

TextStyle styletext({required double fontsize, required FontWeight fontWeight, Color? color}) {
  return TextStyle(fontSize: fontsize, fontWeight: fontWeight, color: color ?? Colors.black);
}
