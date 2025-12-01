import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/data/services/imagekit_endpoint.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          final tes = controller.user.value;
          // final user = controller.user.value;

          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (tes == null) {
            return const Center(child: Text("Belum ada data user"));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 25),
            child: Column(
              children: [
                CustomCardProfile(
                  profileImage: ImagekitEndpoint.images("monyet.jpg"),
                  child: Row(
                    children: [
                      // SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                (tes.name?.isNotEmpty ?? false)
                                    ? tes.name!
                                    : (tes.email?.split('@').first ??
                                        "Tanpa Nama"),
                                style: styletext(
                                    fontsize: 15,
                                    fontWeight: regular,
                                    color: textInputColor),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                tes.email ?? "Tanpa Email",
                                style: styletext(
                                    fontsize: 15,
                                    fontWeight: regular,
                                    color: textInputColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      // Icon(Icons.edit),
                      IconButton(
                        onPressed: () {
                          controller.goTo('/profile-edit');
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
                CustomCardMultiple(
                  children: [
                    CustomMenu(
                        onTap: () => controller.goTo('/address'),
                        leadingIcon: Icons.location_on_outlined,
                        placeholder: "Alamat",
                        trailingIcon: Icons.chevron_right),
                    CustomMenu(
                        onTap: () => controller.goTo('/favorite'),
                        leadingIcon: Icons.favorite_border_outlined,
                        placeholder: "Favorite",
                        trailingIcon: Icons.chevron_right),
                    CustomMenu(
                        onTap: () => controller.goTo('/notification'),
                        leadingIcon: Icons.notifications,
                        placeholder: "Notifikasi",
                        trailingIcon: Icons.chevron_right),
                    CustomMenu(
                        onTap: () => controller.goTo('/regis-provider'),
                        leadingIcon: Icons.person_add,
                        placeholder: "Daftar Sebagai Provider",
                        trailingIcon: Icons.chevron_right),
                  ],
                ),
                CustomCardMultiple(
                  children: [
                    CustomMenu(
                        onTap: () => controller.goTo('/policy'),
                        leadingIcon: Icons.privacy_tip_outlined,
                        placeholder: "Kebijakan",
                        trailingIcon: Icons.chevron_right),
                    CustomMenu(
                        onTap: () => controller.goTo('/term'),
                        leadingIcon: Icons.check_circle_outline,
                        placeholder: "Syarat & Ketentuan",
                        trailingIcon: Icons.chevron_right),
                    CustomMenu(
                        onTap: () => controller.goTo('/report'),
                        leadingIcon: Icons.info_outline_rounded,
                        placeholder: "Laporkan",
                        trailingIcon: Icons.chevron_right),
                  ],
                ),
                CustomCardMultiple(
                  children: [
                    CustomMenu(
                        onTap: () => controller.goTo('/settings'),
                        leadingIcon: Icons.settings,
                        placeholder: "Pengaturan"),
                    CustomMenu(
                        onTap: () => controller.logout(),
                        leadingIcon: Icons.logout,
                        placeholder: "Keluar"),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
