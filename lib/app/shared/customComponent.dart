import 'package:jepretin/app/themes/themes.dart';
import 'package:flutter/material.dart';

customAppbar({
  required VoidCallback backButton,
  required String? title,
  bool centerPosition = false,
  bool isWhite = false,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: isWhite ? whiteColor : primaryColor,
    leading: IconButton(
      onPressed: backButton,
      icon: Icon(
        Icons.arrow_back_rounded,
        color: isWhite ? primaryColor : whiteColor,
      ),
    ),
    elevation: 0.4,
    centerTitle: centerPosition,
    title: Text(
      title ?? '',
      style: styletext(
        fontsize: 20,
        fontWeight: bold,
        color: isWhite ? primaryColor : whiteColor,
      ),
    ),
    actions: actions,
  );
}

Widget customTextField(
    {required String hintText,
    Widget? prefixWidget,
    bool isPassword = false,
    required double width,
    required double height,
    required double borderRadius
    }) {
  return _CustomTextField(
    hintText: hintText,
    prefixWidget: prefixWidget,
    isPassword: isPassword,
    width: width,
    height: height,
    borderRadius: borderRadius,
  );
}

class _CustomTextField extends StatefulWidget {
  final String hintText;
  final Widget? prefixWidget;
  final bool isPassword;
  final double width;
  final double height;
  final double borderRadius;

  const _CustomTextField({
    required this.hintText,
    this.prefixWidget,
    this.isPassword = false,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(widget.borderRadius)),
        child: TextField(
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixWidget,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : null,
            border: InputBorder.none,
          ),
        ));
  }
}