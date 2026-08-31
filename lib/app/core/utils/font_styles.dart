import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Konstanta ketebalan font tetap di luar class biar praktis dipanggil
const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semibold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

enum EnumFontFamily { montserrat, poppins }
enum EnumFontStyle { normal, italic }

TextStyle styletext({
  required double fontsize,
  required FontWeight fontWeight,
  EnumFontStyle fontStyle = EnumFontStyle.normal,
  EnumFontFamily fontFamily = EnumFontFamily.poppins,
  Color? color, // Super penting: biarkan nullable agar responsif terhadap tema!
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
        color: color,
        letterSpacing: letterSpacing,
      );
    case EnumFontFamily.poppins:
      return GoogleFonts.poppins(
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: flutterFontStyle,
        color: color,
        letterSpacing: letterSpacing,
      );
  }
}
