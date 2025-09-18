import 'package:jepretin/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        fontStyle: FontStyle.normal,
        color: isWhite ? primaryColor : whiteColor,
      ),
    ),
    actions: actions,
  );
}

class CustomInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final VoidCallback? onIconTap;
  final TextStyle? hintStyle;
  final String prefixIcon;

  const CustomInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onIconTap,
    this.hintStyle,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 301,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: styletext(
                  fontsize: 13,
                  fontWeight: regular,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'poppins',
                  color: hintInputAuth,
                ),
                filled: true,
                fillColor: inputColorAuth,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5),
                    child: SvgPicture.asset(
                      prefixIcon,
                      width: 20,
                      height: 20,
                      color: hintInputAuth,
                    ))),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}

class CustomInputAuth extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String prefixIcon;
  final TextStyle? hintStyle;

  const CustomInputAuth({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.prefixIcon,
    this.hintStyle,
  });

  @override
  State<CustomInputAuth> createState() => _CustomInputAuthState();
}

class _CustomInputAuthState extends State<CustomInputAuth> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 301,
          child: TextField(
              controller: widget.controller,
              obscureText: _obscureText,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: styletext(
                    fontsize: 13,
                    fontWeight: regular,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'poppins',
                    color: hintInputAuth),
                filled: true,
                fillColor: inputColorAuth,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5),
                    child: SvgPicture.asset(
                      widget.prefixIcon,
                      width: 20,
                      height: 20,
                      color: hintInputAuth,
                    )),
                suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15, left: 5),
                    child: IconButton(
                      icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: hintInputAuth),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )),
              )),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}

class InputWithLabel extends StatelessWidget {
  final String label;
  final Widget input;

  const InputWithLabel({super.key, required this.label, required this.input});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: styletext(
            fontsize: 13,
            fontWeight: bold,
            fontStyle: FontStyle.normal,
            fontFamily: 'poppins',
          ),
        ),
        // const SizedBox(height: 6),
        input,
      ],
    );
  }
}

// Widget customText({
//   required String? title,
//   bool centerPosition = false,
// }) {
//   return Align(
//     alignment: centerPosition,
//     centerTitle: centerPosition,
//     title: Text(
//       title ?? '',
//       style: styletext(
//         fontsize: 20,
//         fontWeight: bold,
//       ),
//     ),
//   );
// }
