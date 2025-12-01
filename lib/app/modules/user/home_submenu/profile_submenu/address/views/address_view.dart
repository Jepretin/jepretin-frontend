import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/data/core/helper/address_helper.dart';
import 'package:jepretin/app/data/models/territory_model.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';
import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat Saya'),
        centerTitle: true,
      ),
      body: GetBuilder<AddressController>(
        init: AddressController(),
        builder: (controller) {
          return Obx(
            () {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: _addressSection(
                  title: "Daftar Alamat",
                  addresses: controller.addresses,
                  onAddAddress: () => controller.openAddAddressPopup(context),
                  // onTapAddress: (addr) => controller.onTapAddress(addr),
                  onTapAddress: (addr) {
                    Get.to(() => _addressEdit(addr));
                  },
                  // onLongPressAddress: (addr) =>
                  //     controller.onLongPressAddress(addr),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Widget reusable untuk daftar alamat
Widget _addressSection({
  required String title,
  required List<AddressModel> addresses,
  required VoidCallback onAddAddress,
  required Function(AddressModel) onTapAddress,
  // required Function(AddressModel) onLongPressAddress,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.black87,
            ),
          ),
        ),

        // Daftar alamat
        if (addresses.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: const Text(
              "Belum ada alamat tersimpan.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          )
        else
          ...addresses.map(
            (addr) => GestureDetector(
              onTap: () => onTapAddress(addr),
              // onLongPress: () => onLongPressAddress(addr),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addr.addressDetail),
                  ],
                ),
              ),
            ),
          ),

        // Tambah alamat baru
        const SizedBox(height: 10),
        GestureDetector(
          onTap: onAddAddress,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Text(
              "+ Tambah Alamat Baru",
              style: TextStyle(
                color: Color(0xFF2C4E80),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget addressItem({
  required AddressModel address,
  required VoidCallback onTap,
  required VoidCallback onLongPress,
}) {
  return GestureDetector(
    onTap: onTap,
    onLongPress: onLongPress,
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address.addressDetail,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${address.village?.name ?? '-'}, ",
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _addressEdit(AddressModel addr) {
  final controller = Get.find<AddressController>();
  return Scaffold(
    appBar: AppBar(title: Text("Edit Alamat")),
    body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Text("Edit alamat untuk: ${addr.village?.name ?? '-'}"),
          CustomCardMultiple(
            children: [
              InputWithLabel(
                label: "Nama Lengkap",
                input: CustomInput(
                  readOnly: true,
                  hintText: addr.userModel?.id ?? "Nama Anda",
                  filled: false,
                  fillColor: Colors.transparent,
                  controller: TextEditingController(),
                ),
              ),
              InputWithLabel(
                label: "Province, Regency, District, Village",
                input: CustomInput(
                  readOnly: true,
                  hintText: formatAddressHierarchy(addr),
                  filled: false,
                  fillColor: Colors.transparent,
                  controller: TextEditingController(),
                  suffixIcon: Icons.arrow_circle_right,
                  onIconTap: () {
                    Get.dialog(
                      AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: Center(
                          child: Text(
                            "Pilih Lokasi",
                            style: styletext(
                              fontsize: 19,
                              fontWeight: semibold,
                              color: textInputColor,
                            ),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // =====================
                            // PROVINCE
                            // =====================
                            InputWithLabel(
                              label: "Provinsi",
                              input: CustomAddressInput(
                                level: AddressLevel.province,
                                hintText: "Pilih Provinsi",
                                handler: controller,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // =====================
                            // REGENCY
                            // =====================
                            InputWithLabel(
                              label: "Kabupaten/Kota",
                              input: CustomAddressInput(
                                level: AddressLevel.regency,
                                hintText: "Pilih Kabupaten/Kota",
                                handler: controller,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // =====================
                            // DISTRICT
                            // =====================
                            InputWithLabel(
                              label: "Kecamatan",
                              input: CustomAddressInput(
                                level: AddressLevel.district,
                                hintText: "Pilih Kecamatan",
                                handler: controller,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // =====================
                            // VILLAGE
                            // =====================
                            InputWithLabel(
                              label: "Desa/Kelurahan",
                              input: CustomAddressInput(
                                level: AddressLevel.village,
                                hintText: "Pilih Desa/Kelurahan",
                                handler: controller,
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          customElevatedButton(
                            text: "Pilih",
                            onTap: () {
                              // **SIMPAN SEMENTARA KE CONTROLLER**
                              controller.editingAddressId.value = addr.village!.id;

                              // Tutup popup
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              InputWithLabel(
                label: "Detail Alamat",
                input: CustomInput(
                  filled: false,
                  hintText: addr.addressDetail,
                  controller: controller.addressDetailController
                    ..text = addr.addressDetail, // SET VALUE AWAL
                ),
              ),

              // InputWithLabel(
              //   label: "Provincec, Regency, District, Village",
              //   input: CustomInput(
              //     readOnly: true,
              //     hintText: formatAddressHierarchy(addr),
              //     filled: false,
              //     fillColor: Colors.transparent,
              //     controller: TextEditingController(),
              //     onIconTap: () {
              //       Get.dialog(
              //         PopScope(
              //           canPop: true,
              //           onPopInvokedWithResult: (didPop, result) {
              //             if (didPop) {
              //               // Bisa digunakan kalau ingin refresh sesuatu setelah popup ditutup
              //             }
              //           },
              //           child: AlertDialog(
              //             backgroundColor: Colors.white,
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(11),
              //             ),
              //             title: Center(
              //               child: Text(
              //                 "Pilih Lokasi",
              //                 style: styletext(
              //                   fontsize: 19,
              //                   fontWeight: semibold,
              //                   color: textInputColor,
              //                 ),
              //               ),
              //             ),
              //             content: Column(
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 // PROVINCE
              //                 InputWithLabel(
              //                   label: "Provinsi",
              //                   input: CustomAddressInput(
              //                     level: AddressLevel.province,
              //                     hintText: "Pilih Provinsi",
              //                     handler: controller,
              //                     hintStyle: styletext(
              //                       fontsize: 10,
              //                       fontWeight: medium,
              //                       color: textInputColor,
              //                     ),
              //                   ),
              //                 ),
              //                 const SizedBox(height: 12),

              //                 // REGENCY
              //                 InputWithLabel(
              //                   label: "Kabupaten/Kota",
              //                   input: CustomAddressInput(
              //                     level: AddressLevel.regency,
              //                     hintText: "Pilih Kabupaten/Kota",
              //                     handler: controller,
              //                     hintStyle: styletext(
              //                       fontsize: 10,
              //                       fontWeight: medium,
              //                       color: textInputColor,
              //                     ),
              //                   ),
              //                 ),
              //                 const SizedBox(height: 12),

              //                 // DISTRICT
              //                 InputWithLabel(
              //                   label: "Kecamatan",
              //                   input: CustomAddressInput(
              //                     level: AddressLevel.district,
              //                     hintText: "Pilih Kecamatan",
              //                     handler: controller,
              //                     hintStyle: styletext(
              //                       fontsize: 10,
              //                       fontWeight: medium,
              //                       color: textInputColor,
              //                     ),
              //                   ),
              //                 ),
              //                 const SizedBox(height: 12),

              //                 // VILLAGE
              //                 InputWithLabel(
              //                   label: "Desa/Kelurahan",
              //                   input: CustomAddressInput(
              //                     level: AddressLevel.village,
              //                     hintText: "Pilih Desa/Kelurahan",
              //                     handler: controller,
              //                     hintStyle: styletext(
              //                       fontsize: 10,
              //                       fontWeight: medium,
              //                       color: textInputColor,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             actions: [
              //               customElevatedButton(
              //                 text: "Pilih",
              //                 onTap: () {
              //                   Get.back();
              //                 },
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //     suffixIcon: Icons.arrow_circle_right,
              //   ),
              // ),
              // InputWithLabel(
              //   label: "Detail Alamat",
              //   input: CustomInput(
              //     hintText: addr.addressDetail,
              //     filled: false,
              //     fillColor: Colors.transparent,
              //     controller: TextEditingController(),
              //   ),
              // ),
            ],
          ),
          CustomCardSingle(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Atur sebagai alamat utama"),
                    //button swict isPrimary = true or false
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 350),
          Row(
            children: [
              customButtonNormal(
                  text: "Hapus Alamat", width: 190, onTap: () => {}),
              Spacer(),
              customButtonNormal(
                  text: "Simpan Alamat",
                  width: 190,
                  onTap: () => controller.updateAddress(addr.id)),
            ],
          ),
        ],
      ),
    ),
  );
}
