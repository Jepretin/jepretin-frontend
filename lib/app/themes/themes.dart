import 'package:flutter/material.dart';

// Font
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xff03314B);
Color whiteColor = const Color(0xffFFFFFF);
Color blackColor = const Color(0xff000000);
Color disableColor = const Color(0xffC4C4C4);
Color inputColor = const Color(0xffF2F2F2);
Color textInputColor = const Color(0xff03314B);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

TextStyle styletext({
  required double fontsize,
  required FontWeight fontWeight,
  Color? color,
  String fontFamily = 'poppins',
  double letterSpacing = 0.0,
}) {
  // return TextStyle(fontSize: fontsize, fontWeight: fontWeight, color: color ?? Colors.black);
  switch (fontFamily.toLowerCase()) {
    case 'montserrat':
      return GoogleFonts.montserrat(
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
        letterSpacing: letterSpacing,
      );
    default:
      return GoogleFonts.poppins(
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
        letterSpacing: letterSpacing,
      );
  }
}

// -8
