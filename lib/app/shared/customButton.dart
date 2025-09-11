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
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 5),
      decoration: BoxDecoration(
        color: isOutlined ? whiteColor : primaryColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: condition ? color : disableColor, width: 1.6),
      ),
      child: Text(
        text,
        style: styletext(
          fontsize: 14,
          fontWeight: bold,
          fontFamily: 'Poppins',
          color:
              condition
                  ? color
                  : isOutlined
                  ? disableColor
                  : whiteColor,
        ),
      ),
    ),
  );
}
