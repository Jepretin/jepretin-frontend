import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/profile_edit_controller.dart';

class ProfileEditView extends GetView<ProfileEditController> {
  const ProfileEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Profil'),
          centerTitle: true,
        ),
        body: GetBuilder(
          init: ProfileEditController(),
          builder: (controller) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(30),
                    width: 370,
                    height: 176,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: blackColor.withOpacity(0.15),
                              blurRadius: 35)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/photo.svg',
                                  width: 24,
                                  height: 24,
                                  color: primaryColor,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Foto Profil",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: "poppins",
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: regular),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/icons/menu_select.svg',
                              width: 11,
                              height: 11,
                              color: primaryColor,
                            )
                          ],
                        ),
                        SizedBox(height: 19),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/user.svg',
                                  width: 24,
                                  height: 24,
                                  color: primaryColor,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Sepuh Gila",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: "poppins",
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: regular),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/icons/menu_select.svg',
                              width: 11,
                              height: 11,
                              color: primaryColor,
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/email.svg',
                                  width: 24,
                                  height: 24,
                                  color: primaryColor,
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "s*****@gmail.com",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: "poppins",
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: regular),
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/icons/menu_select.svg',
                              width: 11,
                              height: 11,
                              color: primaryColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
