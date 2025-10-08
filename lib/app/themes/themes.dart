import 'package:flutter/material.dart';

// Font
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xff03314B);
Color whiteColor = const Color(0xffFFFFFF);
Color blackColor = const Color(0xff000000);
Color disableColor = const Color(0xffC4C4C4);

// Color sesuai yang di figma
Color inputColor = const Color(0xffF2F2F2);
Color inputColorAuth = const Color(0xffEBEDF0);
Color hintInputAuth = const Color(0xff6C6868);
Color textInputColor = const Color(0xff03314B);
Color alertComponentColor = const Color(0xffF66868);
Color Complete = const Color(0xffC7F5D6);
Color Pending = const Color(0xffF5F5C7);
Color Cancel = const Color(0xffFCB9B9);
Color FontComplete = const Color(0xff00C741);
Color FontPending = const Color(0xffC0C000);
Color FontCancel = const Color(0xffE20000);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

enum EnumFontFamily { montserrat, poppins }

enum EnumFontStyle { normal, italic }

enum OrderStatus { complete, pending, cancel }

TextStyle styletext({
  required double fontsize,
  required FontWeight fontWeight,
  EnumFontStyle fontStyle = EnumFontStyle.normal,
  EnumFontFamily fontFamily = EnumFontFamily.poppins,
  Color? color,
  double letterSpacing = 0.0,
}) {
  FontStyle flutterFontStyle =
      fontStyle == EnumFontStyle.italic ? FontStyle.italic : FontStyle.normal;

  switch (fontFamily) {
    case EnumFontFamily.montserrat:
      return GoogleFonts.montserrat(
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: flutterFontStyle,
        color: color ?? Colors.black,
        letterSpacing: letterSpacing,
      );
    case EnumFontFamily.poppins:
    default:
      return GoogleFonts.poppins(
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: flutterFontStyle,
        color: color ?? Colors.black,
        letterSpacing: letterSpacing,
      );
  }
}
