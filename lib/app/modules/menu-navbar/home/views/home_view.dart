import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jepretin/app/modules/auth/login/views/login_view.dart';
import 'package:jepretin/app/modules/auth/register/views/register_view.dart';
// import 'package:jepretin/app/routes/app_pages.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
// import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';
// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controllers/home_controller.dart';

final box = GetStorage();

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  bool get isLoggedIn => box.read("token") != null && box.read("token") != "";

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
                    color: primaryColor,
                    letterSpacing: -3,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _topIconComponent(
                      onTap: () => controller.goToNotif(),
                      icon: Icons.notifications_none_sharp,
                    ),
                    _topIconComponent(
                      onTap: () => controller.goToCart(),
                      icon: Icons.shopping_cart_outlined,
                    ),
                    isLoggedIn
                        ? _topIconComponent(
                            onTap: () => controller.goToProfile(),
                            icon: Icons.person_2_outlined,
                          )
                        : PopupMenuButton<String>(
                            offset: const Offset(0, 70),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 10),
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
                              child: Icon(Icons.person_2_outlined),
                            ),
                            onSelected: (value) {
                              if (value == "login") {
                                Get.to(() => const LoginView());
                              } else if (value == "register") {
                                Get.to(() => const RegisterView());
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: "login",
                                child: Text("Login"),
                              ),
                              const PopupMenuItem(
                                value: "register",
                                child: Text("Register"),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              // goToProfileOrAuth(context),
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
        margin: EdgeInsets.only(left: 10),
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Ingin menampilkan Portofolio Tim kami? klik",
                  softWrap: true,
                  style: styletext(
                    fontsize: 12,
                    fontWeight: medium,
                    fontStyle: EnumFontStyle.italic,
                    fontFamily: EnumFontFamily.montserrat,
                    color: whiteColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      PopScope(
                        canPop: true,
                        onPopInvokedWithResult: (didPop, result) {
                          if (didPop) {
                            controller.selectLocation();
                          }
                        },
                        child: AlertDialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
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
                              InputWithLabel(
                                label: "Alamat",
                                input: CustomAddressInput(
                                  hintText: "Isi alamat sesuai acara",
                                  hintStyle: styletext(
                                    fontsize: 10,
                                    fontWeight: medium,
                                    color: textInputColor,
                                  ),
                                  controller: TextEditingController(),
                                ),
                              ),
                              const SizedBox(height: 15),
                              InputWithLabel(
                                label: "Koordinat",
                                input: CustomInput(
                                  hintText: "Isi koordinat lokasi",
                                  hintStyle: styletext(
                                    fontsize: 10,
                                    fontWeight: medium,
                                    color: textInputColor,
                                  ),
                                  controller: TextEditingController(),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            customElevatedButton(
                              text: "Pilih",
                              onTap: () {
                                controller.selectLocation(); // ✅ ubah state
                                Get.back(); // tutup popup
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    controller.isLocation.value
                        ? "Lokasi sudah dipilih"
                        : "Klik untuk menambahkan lokasi",
                    style: styletext(
                      fontsize: 12,
                      fontWeight: medium,
                      fontFamily: EnumFontFamily.montserrat,
                      color: whiteColor,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBeforeMainView() {
    return SingleChildScrollView(
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
              final item = dummyData[index];
              return SharedCard(
                profileImage: item["profileImage"],
                title: item["title"],
                subtitle: item["subtitle"],
                mainImage: item["mainImage"],
                likes: item["likes"],
                onLike: () => print("Like ${item["title"]}"),
                onOrder: () => print("Order ${item["title"]}"),
                imageRatio: item["ratio"],
              );
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
                  fontFamily: EnumFontFamily.montserrat,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAfterMainView() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              final item = dummyData[index];
              return SharedCard(
                profileImage: item["profileImage"],
                title: item["title"],
                subtitle: item["subtitle"],
                mainImage: item["mainImage"],
                likes: item["likes"],
                onLike: () => print("Like ${item["title"]}"),
                onOrder: () => print("Order ${item["title"]}"),
                imageRatio: item["ratio"],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          ),
        ],
      ),
    );
  }
}
