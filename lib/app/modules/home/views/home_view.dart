import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/routes/app_pages.dart';
import 'package:jepretin/app/shared/customButton.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

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
      body: GetBuilder(
        init: HomeController(),
        builder:
            (controller) => SingleChildScrollView(
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
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
      ),
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
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_cafe_rounded),
              Column(
                children: [
                  Text(
                    "Ingin menampilkan Portofolio Tim kami? klik",
                    softWrap: true,
                    style: styletext(
                      fontsize: 12,
                      fontWeight: medium,
                      fontFamily: 'montserrat',
                      color: primaryColor,
                      // letterSpacing: ,
                    ),
                  ),

                  Text(
                    "disini untuk menambahkan lokasi acara kamu",
                    softWrap: true,
                    style: styletext(
                      fontsize: 12,
                      fontWeight: medium,
                      fontFamily: 'montserrat',
                      color: primaryColor,
                      // letterSpacing: ,
                    ),
                  ),
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
                  child: Image.asset(
                    'assets/images/monyet.jpg',
                    fit: BoxFit.cover,
                  ),
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
                      ),
                    ),
                    Text(
                      'Fotographer',
                      style: styletext(
                        fontsize: 12,
                        fontWeight: light,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert),
            ],
          ),
          // Text(
          //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
          //   style: styletext(fontsize: 12, fontWeight: medium),
          // ),
          Container(
            height: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[300],
            ),
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
}
