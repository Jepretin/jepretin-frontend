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
