// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:flutter/material.dart';
// import 'package:jepretin/app/data/request/territory_service.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:jepretin/app/data/models/territory_model.dart';
import 'package:jepretin/app/core/helper/address_helper.dart';
import 'package:jepretin/app/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jepretin/app/core/constants/imagekit_endpoint.dart';

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

class CustomInput extends StatelessWidget {
  final bool? readOnly;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool? filled;
  final Color? fillColor;
  final VoidCallback? onIconTap;
  final TextStyle? hintStyle;
  final String? prefixIcon;
  final IconData? suffixIcon;
  final double? width;
  final double? height;

  const CustomInput({
    super.key,
    this.readOnly,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.filled,
    this.fillColor,
    this.onIconTap,
    this.hintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          child: TextField(
            readOnly: readOnly ?? false,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: styletext(
                fontsize: 13,
                fontWeight: regular,
                color: hintInputAuth,
              ),
              filled: filled ?? true,
              fillColor: fillColor ?? inputColorAuth,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20, // jarak kiri-kanan hintText
                vertical: 18, // jarak atas-bawah hintText
              ),
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 18, right: 10),
                      child: SvgPicture.network(
                        ImagekitEndpoint.icon(
                            prefixIcon!), // memanggil file dari ImageKit
                        width: 20,
                        height: 20,
                        color: hintInputAuth,
                        placeholderBuilder: (context) => const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 1.5),
                        ),
                      ),
                    )
                  : null,
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
          ),
        ),
      ],
    );
  }
}

class CustomInputAuth extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? iconName;
  final TextStyle? hintStyle;

  const CustomInputAuth({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.iconName,
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
                fontsize: 12,
                fontWeight: medium,
                color: textInputColor.withOpacity(0.7),
              ),
              filled: true,
              fillColor: inputColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              prefixIcon: widget.iconName != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 15, right: 5),
                      child: SvgPicture.network(
                        ImagekitEndpoint.icon(widget.iconName!),
                        color: hintInputAuth,
                        width: 21,
                        height: 21,
                        placeholderBuilder: (context) => const SizedBox(
                          width: 21,
                          height: 21,
                          child: CircularProgressIndicator(strokeWidth: 1.5),
                        ),
                      ),
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
                  }),
            ),
          ),
        ),
      ],
    );
  }
}

abstract class AddressSelectable {
  Future<List<dynamic>> searchProvinces(String q);
  Future<List<dynamic>> searchRegencies(String q);
  Future<List<dynamic>> searchDistricts(String q);
  Future<List<dynamic>> searchVillages(String q);

  void onProvinceSelected(ProvinceModel p);
  void onRegencySelected(RegencyModel r);
  void onDistrictSelected(DistrictModel d);
  void onVillageSelected(VillageModel v);

  TextEditingController get provinceController;
  TextEditingController get regencyController;
  TextEditingController get districtController;
  TextEditingController get villageController;

  Future<List<dynamic>> search(AddressLevel level, String q);
  void select(AddressLevel level, dynamic item);
}

class CustomAddressInput extends StatefulWidget {
  final AddressLevel level;
  final String hintText;
  final IconData? suffixIcon;
  final VoidCallback? onIconTap;
  final TextStyle? hintStyle;

  // ⬅️ Tambah ini
  final AddressSelectable handler;

  const CustomAddressInput({
    super.key,
    required this.level,
    required this.hintText,
    required this.handler,
    this.suffixIcon,
    this.onIconTap,
    this.hintStyle,
  });

  @override
  State<CustomAddressInput> createState() => _CustomAddressInputState();
}

class _CustomAddressInputState extends State<CustomAddressInput> {
  @override
  Widget build(BuildContext context) {
    final handler = widget.handler;

    // Ambil controller yang sesuai level
    final TextEditingController controller =
        AddressHelper.getController(widget.level, handler);

    return TypeAheadField<dynamic>(
      controller: controller,
      suggestionsCallback: (search) =>
          AddressHelper.search(widget.level, search, handler),
      builder: (context, c, focus) {
        return TextField(
          controller: c,
          focusNode: focus,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    icon: Icon(widget.suffixIcon),
                    onPressed: widget.onIconTap,
                  )
                : null,
          ),
        );
      },
      itemBuilder: (context, item) {
        return ListTile(title: Text(item.name));
      },
      onSelected: (item) => handler.select(widget.level, item),
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

  final List<DataProvider> address = [
    DataProvider(city: "Jakarta", province: "Indonesia"),
    DataProvider(city: "Bandung", province: "Indonesia"),
    DataProvider(city: "Surabaya", province: "Indonesia"),
    DataProvider(city: "Medan", province: "Indonesia"),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TypeAheadField<DataProvider>(
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
  final double maxWidth;

  const InputWithLabel({
    super.key,
    required this.label,
    required this.input,
    this.maxWidth = 500, // default lebar maksimal
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              textAlign: TextAlign.start,
              style: styletext(
                fontsize: 13,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 6),
            input,
          ],
        ),
      ),
    );
  }
}

Widget CustomMenu({
  required IconData leadingIcon,
  required String placeholder,
  IconData? trailingIcon,
  VoidCallback? onTap,
  EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 12),
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(8),
    child: Padding(
      padding: padding,
      child: Row(
        children: [
          Icon(leadingIcon, color: textInputColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              placeholder,
              style: styletext(
                fontsize: 15,
                fontWeight: regular,
                color: textInputColor,
              ),
            ),
          ),
          if (trailingIcon != null) Icon(trailingIcon, color: textInputColor),
        ],
      ),
    ),
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

class StatusBadge extends StatelessWidget {
  final OrderStatus status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    String displayText;

    switch (status) {
      case OrderStatus.complete:
        bgColor = complete;
        textColor = fontComplete;
        displayText = "Complete";
        break;
      case OrderStatus.pending:
        bgColor = pending;
        textColor = fontPending;
        displayText = "Pending";
        break;
      case OrderStatus.cancel:
        bgColor = cancel;
        textColor = fontCancel;
        displayText = "Cancel";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        displayText,
        style: TextStyle(
          color: textColor,
          fontSize: 7,
          fontWeight: semibold,
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final TextStyle? titleStyle;

  const CustomDropdown({
    super.key,
    required this.title,
    this.children = const [],
    this.titleStyle,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: primaryColor)),
          ),
          child: Row(
            children: [
              Text(
                widget.title,
                style: widget.titleStyle ??
                    TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: primaryColor),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: Icon(
                  _isExpanded ? Icons.expand_more : Icons.chevron_right,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),

        // Dropdown Content
        if (_isExpanded)
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            ),
          ),
      ],
    );
  }
}

class ToppingListSection extends StatelessWidget {
  final List<ToppingItemModel> toppings;
  final VoidCallback? onAddTap;
  final VoidCallback? onSeeAllTap;

  const ToppingListSection({
    super.key,
    required this.toppings,
    this.onAddTap,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Daftar Topping",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: onSeeAllTap,
                child: Row(
                  children: const [
                    Text(
                      "Lihat Semua",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward_ios,
                        size: 12, color: Colors.blueGrey),
                  ],
                ),
              )
            ],
          ),

          const SizedBox(height: 16),

          // TAMBAH TOPPING
          InkWell(
            onTap: onAddTap,
            child: DottedBorder(
              dashPattern: const [6, 2], // garis 6px, jarak 4px
              strokeWidth: 1.2,
              color: Colors.grey,
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),

              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                width: double.infinity,
                child: const Text(
                  "+ Tambah Topping",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // LIST TOPPING
          Column(
            children: toppings
                .map((t) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ToppingItem(
                        name: t.name,
                        price: t.price,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ToppingItem extends StatelessWidget {
  final String name;
  final String price;

  const ToppingItem({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFEFF5F9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

// MODEL SIMPLE UNTUK DATA
class ToppingItemModel {
  final String name;
  final String price;

  ToppingItemModel(this.name, this.price);
}
