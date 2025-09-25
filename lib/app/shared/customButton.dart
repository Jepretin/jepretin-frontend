import 'package:jepretin/app/themes/themes.dart';
import 'package:flutter/widgets.dart';

Widget customElevatedButton({
  bool condition = true,
  bool isOutlined = false,
  required String text,
  required VoidCallback onTap,
}) {
  Color color = !isOutlined ? whiteColor : primaryColor;

  return GestureDetector(
    onTap: condition ? onTap : null,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: isOutlined ? whiteColor : primaryColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: condition ? color : disableColor, width: 1.6),
      ),
      child: Text(
        text,
        style: styletext(
          fontsize: 18,
          fontWeight: medium,
          color: condition
              ? color
              : isOutlined
                  ? disableColor
                  : whiteColor,
        ),
      ),
    ),
  );
}

Widget customAuthButton(
    {required String text,
    bool enable = true,
    Color? textColor,
    bool isOutlined = false,
    required VoidCallback onTap,
    double fillOpacity = 1.0}) {
  Color fg = textColor ?? (isOutlined ? primaryColor : whiteColor);

  return Center(
    child: Container(
      width: 301,
      height: 56,
      child: GestureDetector(
        onTap: enable ? onTap : null,
        child: Opacity(
          opacity: enable ? 1.0 : 0.6,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(fillOpacity),
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: styletext(
                fontsize: 13,
                fontWeight: bold,
                color: enable ? fg : whiteColor,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

customButtonKecil({
  required String text,
  required VoidCallback onTap,
  bool enable = true,
  double? width,
  double? height,
}) {
  return GestureDetector(
    onTap: enable ? onTap : null,
    child: Container(
      width: width, // <--- pake di sini
      height: height, // <--- pake di sini
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(24),
        // border: Border.all(width: 1.6),
      ),
      alignment: Alignment.center, // biar teksnya tetap di tengah
      child: Text(
        text,
        style: styletext(
          fontsize: 8,
          fontWeight: semibold,
          color: whiteColor,
        ),
      ),
    ),
  );
}

customButtonNormal({
  required String text,
  required VoidCallback onTap,
  bool enable = true,
  double? width,
  double? height,
}) {
  return GestureDetector(
    onTap: enable ? onTap : null,
    child: Container(
      width: width, // <--- pake di sini
      height: height, // <--- pake di sini
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(24),
        // border: Border.all(width: 1.6),
      ),
      alignment: Alignment.center, // biar teksnya tetap di tengah
      child: Text(
        text,
        style: styletext(
          fontsize: 13,
          fontWeight: semibold,
          color: whiteColor,
        ),
      ),
    ),
  );
}
