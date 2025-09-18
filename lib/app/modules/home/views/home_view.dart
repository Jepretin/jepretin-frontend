import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:jepretin/app/routes/app_pages.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
// import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';
// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController(), permanent: true);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 80),
        child: Container(
          // color: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.5,
                child: Text(
                  'Jepretin.',
                  style: styletext(
                    fontsize: 35,
                    fontWeight: bold,
                    fontFamily: 'poppins',
                    fontStyle: FontStyle.normal,
                    color: primaryColor,
                    letterSpacing: -3,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 15,
                  children: [
                    _topIconComponent(
                      onTap: () {},
                      icon: Icons.notifications_none_sharp,
                    ),
                    _topIconComponent(
                      onTap: () {},
                      icon: Icons.shopping_cart_outlined,
                    ),
                    _topIconComponent(
                      onTap: () {},
                      icon: Icons.person_2_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        return controller.isLocation.value
            ? buildAfterMainView()
            : buildBeforeMainView();
      }),
    );
  }

  Widget _topIconComponent({
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: whiteColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: blackColor.withOpacity(0.2),
              spreadRadius: 0.5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Icon(icon),
      ),
    );
  }

  Widget _alertContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: alertComponentColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            spreadRadius: -5,
            color: alertComponentColor,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'icons/ads.svg',
                width: 41,
                height: 41,
                color: whiteColor,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ingin menampilkan Portofolio Tim kami? klik",
                    softWrap: true,
                    style: styletext(
                      fontsize: 12,
                      fontWeight: medium,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'montserrat',
                      color: whiteColor,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.dialog(
                          AlertDialog(
                            backgroundColor: Colors.white, // ubah background
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(11), // rounded corner
                            ),
                            title: Center(
                              child: Column(
                                children: [
                                  Text(
                                    "Pilih Lokasi",
                                    style: styletext(
                                        fontsize: 19,
                                        fontWeight: semibold,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'poppins',
                                        color: textInputColor),
                                  ),
                                ],
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 12),
                                InputWithLabel(
                                    label: "Alamat",
                                    input: CustomAddressInput(
                                        hintText:
                                            "Pilih lokasi alamat sesuai dengan acara",
                                        hintStyle: styletext(
                                            fontsize: 10,
                                            fontWeight: medium,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'poppins',
                                            color: textInputColor),
                                        controller: TextEditingController())),
                                // Obx(() => DropdownButtonFormField<String>(
                                //       value: controller
                                //               .selectedLocation.value.isEmpty
                                //           ? null
                                //           : controller.selectedLocation.value,
                                //       decoration: InputDecoration(
                                //         border: OutlineInputBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(12),
                                //         ),
                                //         contentPadding: EdgeInsets.symmetric(
                                //             horizontal: 12, vertical: 10),
                                //       ),
                                //       hint: Text("Pilih daerah"),
                                //       items: ["Jakarta", "Bandung", "Surabaya"]
                                //           .map((e) => DropdownMenuItem(
                                //               value: e, child: Text(e)))
                                //           .toList(),
                                //       onChanged: (val) {
                                //         controller.selectedLocation.value =
                                //             val!;
                                //         Get.back(); // tutup popup
                                //       },
                                //     )),
                                SizedBox(height: 15),
                                InputWithLabel(
                                    label: "Koordinat Alamat",
                                    input: CustomInput(
                                        hintText:
                                            "Isi koordinat alamat agar provider lokasi tepatnya",
                                        hintStyle: styletext(
                                            fontsize: 10,
                                            fontWeight: medium,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'poppins',
                                            color: textInputColor),
                                        controller: TextEditingController())),
                              ],
                            ),
                            actions: [
                              customElevatedButton(
                                  text: "Pilih",
                                  onTap: () => Get.to(buildAfterMainView()))
                            ],
                          ),
                        );
                      },
                      child: Text(
                        controller.selectedLocation.value.isEmpty
                            ? "disini untuk menambahkan lokasi acara kamu"
                            : "Lokasi: ${controller.selectedLocation.value}",
                        style: styletext(
                          fontsize: 12,
                          fontWeight: medium,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'montserrat',
                          color: whiteColor,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuContainer({
    String? nama,
    String? role,
    String? subtitle,
    String? pathGambar,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 0.2,
            color: Colors.black.withOpacity(0.2),
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset('images/monyet.jpg', fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tim Jepretin',
                      style: styletext(
                        fontsize: 18,
                        fontWeight: medium,
                        fontFamily: 'poppins',
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      'Fotographer',
                      style: styletext(
                        fontsize: 12,
                        fontWeight: light,
                        fontFamily: 'poppins',
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert),
            ],
          ),
          Container(
            height: 200,
            child: Image.asset("images/monyet.jpg", fit: BoxFit.cover),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  spacing: 6,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.isStar = !controller.isStar;
                        controller.update();
                      },
                      child: Icon(
                        controller.isStar
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                    Text(
                      '18',
                      style: styletext(
                        fontsize: 18,
                        fontWeight: bold,
                        fontFamily: 'poppins',
                        fontStyle: FontStyle.normal,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              customElevatedButton(
                condition: false,
                isOutlined: true,
                text: 'Pesan',
                onTap: () {
                  print('object');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget locationSelection() {

  // }

  Widget buildBeforeMainView() {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) => SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            _alertContainer(),
            SizedBox(height: 15),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return _menuContainer();
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
            ),
            SizedBox(height: 100),
            Column(
              children: [
                Text(
                  'Tambahkan lokasi acaramu untuk memuat lebih banyak...',
                  style: styletext(
                    fontsize: 12,
                    fontWeight: light,
                    fontFamily: 'montserrat',
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAfterMainView() {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) => SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            // ListView.separated(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: 1,
            //   itemBuilder: (context, index) {
            //     return _menuContainer();
            //   },
            //   separatorBuilder: (context, index) => SizedBox(height: 10),
            // ),
            SizedBox(height: 15),
            SharedCard(
              profileImage: "images/monyet.jpg",
              title: "Tim Jepretin",
              subtitle: "Photographer",
              mainImage: "images/content/mount.png",
              likes: 18,
              onLike: () {},
              onOrder: () {},
              isPortrait: false, // default
            ),
            SharedCard(
              profileImage: "images/monyet.jpg",
              title: "Diamond Pictora",
              subtitle: "Photographer and Videographer",
              mainImage: "images/content/wedding.png",
              likes: 18,
              onLike: () {},
              onOrder: () {},
              isPortrait: true, // ✅
            ),
          ],
        ),
      ),
    );
  }
}
