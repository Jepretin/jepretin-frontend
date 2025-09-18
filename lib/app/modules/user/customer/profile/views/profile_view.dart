import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder(
        init: ProfileController(),
        builder: (controller) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 370,
                    height: 77,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.15),
                            blurRadius: 35,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 16),
                            CircleAvatar(
                              radius: 22,
                              backgroundImage:
                                  AssetImage("assets/images/kucing_sepuh.jpg"),
                            ),
                            SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sepuh Gilga",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "poppins",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: semibold,
                                      color: primaryColor),
                                ),
                                Text(
                                  "segi22@gmail.com",
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontFamily: "poppins",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: light,
                                      color: primaryColor),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                          SizedBox(width: 16),
                            SvgPicture.asset('assets/icons/email.svg',
                                width: 24, height: 24, color: primaryColor)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 370,
                    height: 210,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.25),
                            blurRadius: 35,
                          )
                        ]),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 370,
                    height: 167,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.25),
                            blurRadius: 35,
                          )
                        ]),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 370,
                    height: 135,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.25),
                            blurRadius: 35,
                          )
                        ]),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
