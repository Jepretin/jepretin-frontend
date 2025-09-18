import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pesan Jasa'), centerTitle: true),
      body: GetBuilder(
          init: ProfileController(),
          builder: (controller) => SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                child: Column(
                  children: [
                    CustomCardProfile(
                      profileImage: "images/monyet.jpg",
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Nama User",
                                    style: styletext(
                                        fontsize: 15,
                                        fontWeight: regular,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'poppins',
                                        color: textInputColor),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "email@gmail.com",
                                    style: styletext(
                                        fontsize: 15,
                                        fontWeight: regular,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'poppins',
                                        color: textInputColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.edit),
                        ],
                      ),
                    ),
                    CustomCardMultiple(
                      children: [
                        CustomMenu(
                            leadingIcon: Icons.location_on_outlined,
                            placeholder: "Alamat",
                            trailingIcon: Icons.chevron_right),
                        SizedBox(height: 20),
                        CustomMenu(
                            leadingIcon: Icons.favorite_border_outlined,
                            placeholder: "Favorite",
                            trailingIcon: Icons.chevron_right),
                        SizedBox(height: 20),
                        CustomMenu(
                            leadingIcon: Icons.notifications,
                            placeholder: "Notifikasi",
                            trailingIcon: Icons.chevron_right),
                        SizedBox(height: 20),
                        CustomMenu(
                            leadingIcon: Icons.person_add,
                            placeholder: "Daftar Sebagai Provider",
                            trailingIcon: Icons.chevron_right),
                      ],
                    ),
                    CustomCardMultiple(
                      children: [
                        CustomMenu(
                            leadingIcon: Icons.privacy_tip_outlined,
                            placeholder: "Kebijakan",
                            trailingIcon: Icons.chevron_right),
                        SizedBox(height: 20),
                        CustomMenu(
                            leadingIcon: Icons.check_circle_outline,
                            placeholder: "Syarat & Ketentuan",
                            trailingIcon: Icons.chevron_right),
                        SizedBox(height: 20),
                        CustomMenu(
                            leadingIcon: Icons.info_outline_rounded,
                            placeholder: "Laporkan",
                            trailingIcon: Icons.chevron_right),
                      ],
                    ),
                    CustomCardMultiple(
                      children: [
                        CustomMenu(
                            leadingIcon: Icons.settings,
                            placeholder: "Pengaturan"),
                        SizedBox(height: 20),
                        CustomMenu(
                            leadingIcon: Icons.logout, placeholder: "Keluar"),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}
