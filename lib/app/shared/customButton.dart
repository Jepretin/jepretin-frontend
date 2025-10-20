import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/modules/user/customer/menu_profile/regis_provider/controllers/regis_provider_controller.dart';
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

class RoleSelector extends StatelessWidget {
  final RegisProviderController controller;
  final double minWidth;
  final EdgeInsetsGeometry? margin;

  const RoleSelector({
    super.key,
    required this.controller,
    this.minWidth = 110,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Wrap(
        spacing: 12,
        runSpacing: 10,
        children: controller.availableRoles.map((roleModel) {
          final role = roleModel.name; // kalau datanya pakai model
          final isSelected = controller.selectedRoles.contains(roleModel.id);

          return GestureDetector(
            onTap: () => controller.toggleRole(roleModel.id),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              constraints: BoxConstraints(minWidth: minWidth),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              margin: margin,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.blueAccent.withOpacity(0.1)
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected ? Colors.blueAccent : Colors.grey.shade400,
                  width: 1.5,
                ),
              ),
              child: Text(
                role,
                style: TextStyle(
                  color: isSelected ? Colors.blueAccent : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}

// class RoleSelector extends StatelessWidget {
//   final List<String> availableRoles;
//   final RxList<String> selectedRoles;
//   final Function(String role) onToggle;
//   final double minWidth;
//   final EdgeInsetsGeometry? margin;

//   const RoleSelector({
//     super.key,
//     required this.availableRoles,
//     required this.selectedRoles,
//     required this.onToggle,
//     this.minWidth = 110,
//     this.margin,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 12,
//       runSpacing: 10,
//       children: availableRoles.map((role) {
//         final isSelected = selectedRoles.contains(role);

//         return GestureDetector(
//           onTap: () => onToggle(role),
//           child: Container(
//             constraints: BoxConstraints(minWidth: minWidth),
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             margin: margin,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? Colors.blueAccent.withOpacity(0.1)
//                   : Colors.grey[200],
//               borderRadius: BorderRadius.circular(30),
//               border: Border.all(
//                 color: isSelected ? Colors.blueAccent : Colors.grey.shade400,
//                 width: 1.5,
//               ),
//             ),
//             child: Text(
//               role,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: isSelected ? Colors.blueAccent : Colors.black87,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// class RoleSelector extends StatefulWidget {
//   final List<String> availableRoles;
//   final RxList<String> selectedRoles;
//   final Function(String role) onToggle;
//   final double minWidth; // 🔥 Tambahan parameter
//   final EdgeInsetsGeometry? margin; // opsional biar bisa atur jarak luar

//   const RoleSelector({
//     super.key,
//     required this.availableRoles,
//     required this.selectedRoles,
//     required this.onToggle,
//     this.minWidth = 110, // default lebar minimal tombol
//     this.margin,
//   });

//   @override
//   State<RoleSelector> createState() => _RoleSelectorState();
// }

// class _RoleSelectorState extends State<RoleSelector> {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Wrap(
//         spacing: 12,
//         runSpacing: 10,
//         children: widget.availableRoles.map((role) {
//           final isSelected = widget.selectedRoles.contains(role);

//           return GestureDetector(
//             onTap: () => widget.onToggle(role),
//             child: Container(
//               constraints: BoxConstraints(
//                 minWidth: widget.minWidth, // 🔥 diatur di sini
//               ),
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 10,
//               ),
//               margin: widget.margin,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: isSelected
//                     ? Colors.blueAccent.withOpacity(0.1)
//                     : Colors.grey[200],
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(
//                   color:
//                       isSelected ? Colors.blueAccent : Colors.grey.shade400,
//                   width: 1.5,
//                 ),
//               ),
//               child: Text(
//                 role,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: isSelected ? Colors.blueAccent : Colors.black87,
//                   fontWeight:
//                       isSelected ? FontWeight.bold : FontWeight.normal,
//                 ),
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
