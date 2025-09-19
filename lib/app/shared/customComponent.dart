import 'package:jepretin/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
  final IconData? suffixIcon;
  final VoidCallback? onIconTap;
  final TextStyle? hintStyle;

  const CustomInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onIconTap,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: styletext(
            fontsize: 12,
            fontWeight: medium,
            fontStyle: FontStyle.normal,
            fontFamily: 'poppins',
            color: textInputColor.withOpacity(0.7),
          ),
          filled: true,
          fillColor: inputColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon, color: Colors.blueGrey, size: 21),
                  onPressed: onIconTap,
                )
              : null,
        ),
      ),
    );
  }
}

class CustomInputAuth extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData? icon;
  final TextStyle? hintStyle;

  const CustomInputAuth({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.hintStyle,
  });

  @override
  State<CustomInputAuth> createState() => _CustomInputAuthState();
}

class _CustomInputAuthState extends State<CustomInputAuth> {
  bool _obscureText = true; // bisa berubah

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: styletext(
            fontsize: 12,
            fontWeight: medium,
            fontStyle: FontStyle.normal,
            fontFamily: 'poppins',
            color: textInputColor.withOpacity(0.7),
          ),
          filled: true,
          fillColor: inputColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          prefixIcon: widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  child: Icon(widget.icon, color: Colors.blueGrey, size: 21),
                )
              : null,
          suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              })),
    );
  }
}

class DataCity {
  final String city;
  final String province;

  DataCity({required this.city, required this.province});
}

class CustomAddressInput extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final TextStyle? hintStyle;
  final VoidCallback? onIconTap;
  final TextEditingController controller;

  CustomAddressInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.onIconTap,
    this.hintStyle,
  });

  final List<DataCity> address = [
    DataCity(city: "Jakarta", province: "Indonesia"),
    DataCity(city: "Bandung", province: "Indonesia"),
    DataCity(city: "Surabaya", province: "Indonesia"),
    DataCity(city: "Medan", province: "Indonesia"),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TypeAheadField<DataCity>(
        controller: controller,
        suggestionsCallback: (search) {
          final q = search.toLowerCase();
          return address
              .where((datacity) => datacity.city.toLowerCase().contains(q))
              .toList();
        },
        builder: (context, controller, focusNode) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: styletext(
                fontsize: 12,
                fontWeight: medium,
                fontFamily: 'poppins',
                fontStyle: FontStyle.normal,
                color: textInputColor.withOpacity(0.7),
              ),
              filled: true,
              fillColor: inputColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        suffixIcon,
                        color: Colors.blueGrey,
                        size: 21,
                      ),
                      onPressed: onIconTap,
                    )
                  : null,
            ),
          );
        },
        itemBuilder: (context, datacity) {
          return ListTile(
            title: Text(datacity.city),
            subtitle: Text(datacity.province),
          );
        },
        onSelected: (datacity) {
          controller.text = datacity.city;
        },
      ),
    );
  }
}

class DateTimeInput extends StatelessWidget {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  DateTimeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Tanggal
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Tanggal Acara",
                    textAlign: TextAlign.start,
                    style: styletext(
                      fontsize: 13,
                      fontWeight: bold,
                      fontFamily: 'poppins',
                      fontStyle: FontStyle.normal,
                      color: textInputColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              TextField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Tanggal Acara",
                  hintStyle: styletext(
                    fontsize: 12,
                    fontWeight: medium,
                    fontFamily: 'poppins',
                    fontStyle: FontStyle.normal,
                    color: textInputColor.withOpacity(0.7),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: Colors.blueGrey,
                  ),
                ),
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    dateController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        // Waktu
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Waktu Acara",
                    textAlign: TextAlign.start,
                    style: styletext(
                      fontsize: 13,
                      fontWeight: bold,
                      fontFamily: 'poppins',
                      fontStyle: FontStyle.normal,
                      color: textInputColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              TextField(
                controller: timeController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Waktu Acara",
                  hintStyle: styletext(
                    fontsize: 12,
                    fontWeight: medium,
                    fontFamily: 'poppins',
                    fontStyle: FontStyle.normal,
                    color: textInputColor.withOpacity(0.7),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Icon(Icons.access_time, color: Colors.blueGrey),
                ),
                onTap: () async {
                  final pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    timeController.text = pickedTime.format(context);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DataProvider {
  final String city;
  final String province;

  DataProvider({required this.city, required this.province});
}

class CustomProviderInput extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final TextStyle? hintStyle;
  final VoidCallback? onIconTap;
  final TextEditingController controller;

  CustomProviderInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.onIconTap,
    this.hintStyle,
  });

  final List<DataCity> address = [
    DataCity(city: "Jakarta", province: "Indonesia"),
    DataCity(city: "Bandung", province: "Indonesia"),
    DataCity(city: "Surabaya", province: "Indonesia"),
    DataCity(city: "Medan", province: "Indonesia"),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TypeAheadField<DataCity>(
        controller: controller,
        suggestionsCallback: (search) {
          final q = search.toLowerCase();
          return address
              .where((datacity) => datacity.city.toLowerCase().contains(q))
              .toList();
        },
        builder: (context, controller, focusNode) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: styletext(
                fontsize: 12,
                fontWeight: medium,
                fontFamily: 'poppins',
                fontStyle: FontStyle.normal,
                color: textInputColor.withOpacity(0.7),
              ),
              filled: true,
              fillColor: inputColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        suffixIcon,
                        color: Colors.blueGrey,
                        size: 21,
                      ),
                      onPressed: onIconTap,
                    )
                  : null,
            ),
          );
        },
        itemBuilder: (context, datacity) {
          return ListTile(
            title: Text(datacity.city),
            subtitle: Text(datacity.province),
          );
        },
        onSelected: (datacity) {
          controller.text = datacity.city;
        },
      ),
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
        const SizedBox(height: 6),
        input,
      ],
    );
  }
}

CustomMenu({
  required IconData leadingIcon,
  required String placeholder,
  IconData? trailingIcon, // optional
}) {
  return Row(
    children: [
      Icon(leadingIcon, color: textInputColor),
      const SizedBox(width: 10),
      Expanded(
        child: Text(
          placeholder,
          style: styletext(
              fontsize: 15,
              fontWeight: regular,
              fontStyle: FontStyle.normal,
              fontFamily: 'poppins',
              color: textInputColor),
        ),
      ),
      if (trailingIcon != null) Icon(trailingIcon, color: textInputColor),
    ],
  );
}

class SharedDraggableSheet extends StatelessWidget {
  final List<Widget> children; // isi sheet biar fleksibel
  final double initialSize;
  final double minSize;
  final double maxSize;

  const SharedDraggableSheet({
    super.key,
    required this.children,
    this.initialSize = 0.2,
    this.minSize = 0.1,
    this.maxSize = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialSize,
      minChildSize: minSize,
      maxChildSize: maxSize,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              )
            ],
          ),
          child: ListView(
            controller: scrollController,
            children: children,
          ),
        );
      },
    );
  }
}
