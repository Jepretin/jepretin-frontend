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
      body: GetBuilder<RegisProviderController>(
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          child: Obx(
            () {
              final currentUser = controller.user.value;

              if (currentUser == null) {
                return const Center(child: Text("Belum ada data user"));
              }

              return Column(
                children: [
                  InputWithLabel(
                    label: "Nama Lengkap",
                    input: CustomInput(
                      hintText: currentUser.name ?? "",
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
                      hintText: currentUser.phone ?? "",
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
                      controller: controller, // kirim controllernya langsung
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
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min, // biar tingginya menyesuaikan konten
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => customAuthButton(
                text: controller.isLoading.value ? "Loading" : "Daftar",
                onTap: () {
                  controller.registerProvider();
                  print("Menekan Tombol Daftar");
                },
                textColor: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


