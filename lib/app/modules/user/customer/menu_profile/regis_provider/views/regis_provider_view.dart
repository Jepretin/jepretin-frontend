import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/regis_provider_controller.dart';

class RegisProviderView extends GetView<RegisProviderController> {
  const RegisProviderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran Provider'),
        titleTextStyle: styletext(
            fontsize: 19, fontWeight: semibold, color: textInputColor),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pop(context), // kembali ke halaman sebelumnya
        ),
      ),
      body: GetBuilder(
        init: RegisProviderController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          child: Column(
            children: [
              InputWithLabel(
                label: "Nama Lengkap",
                input: CustomInput(
                  hintText: "Masukkan Nama Lengkapmu",
                  controller: controller.nameController,
                  suffixIcon: Icons.edit, // ✏️ icon di kanan
                  onIconTap: () {
                    print("Icon edit diklik");
                  },
                ),
              ),
              SizedBox(height: 14),
              InputWithLabel(
                label: "Nomor WhatsApp",
                input: CustomInput(
                  // width: 401,
                  hintText: "Lengkapi detail alamat kamu",
                  controller: controller.phoneController,
                  suffixIcon: Icons.edit, // ✏️ icon di kanan
                  onIconTap: () {
                    print("Icon edit diklik");
                  },
                ),
              ),
              SizedBox(height: 14),
              InputWithLabel(
                label: "Pilih Role Kamu",
                input: RoleSelector(
                  availableRoles: ["Photography", "Videography", "MUA"],
                  selectedRoles: controller.selectedRoles,
                  onToggle: (role) => controller.toggleRole(role),
                  minWidth: 120, // 👉 Atur lebar kiri-kanannya
                ),
                maxWidth: 400,
              ),
              SizedBox(height: 14),
              InputWithLabel(
                label: "Pengalaman Kerja",
                input: CustomInput(
                  // width: 401,
                  hintText: "Berupa Link Drive",
                  controller: controller.driveLinkController,
                  suffixIcon: Icons.edit, // ✏️ icon di kanan
                  onIconTap: () {
                    print("Icon edit diklik");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min, // biar tingginya menyesuaikan konten
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : controller.registerProvider,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Daftar Sekarang")),
            ),
          ],
        ),
      ),
    );
  }
}

Widget ValidasionProvider() {
  return Padding(
    padding: EdgeInsets.all(1),
  );
}

Widget ValidasionProviderComplated() {
  return Padding(
    padding: EdgeInsets.all(1),
  );
}

Widget ValidasionProviderRejected() {
  return Padding(
    padding: EdgeInsets.all(1),
  );
}
