import 'package:flutter_svg/svg.dart';
import 'package:jepretin/app/shared/customComponent.dart';
import 'package:jepretin/app/themes/themes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_provider_controller.dart';

class MainProviderView extends GetView<MainProviderController> {
  const MainProviderView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainProviderController(),
      builder: (controller) => Scaffold(
        floatingActionButton: SizedBox(
          height: 75,
          width: 75,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () => controller.goTo('/unggah-porto'),
              shape: const CircleBorder(),
              // child: Icon(Icons.send, color: Colors.white, size: 28),
              child: SizedBox(
                child: SvgPicture.asset('/icons/add-image.svg',
                    height: 26, width: 26, color: whiteColor),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(
            12.0,
          ), // jarak biar kelihatan melayang
          child: PhysicalShape(
            clipper: _BottomBarClipper(),
            elevation: 5,
            color: whiteColor,
            shadowColor: blackColor,
            child: SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navBarIcon(controller, 0, "/icons/home.svg"),
                  _navBarIcon(controller, 1, "/icons/order-dashboard-provider.svg"),
                  const SizedBox(width: 40),
                  _navBarIcon(controller, 2, "/icons/jasa-before.svg"),
                  _navBarIcon(controller, 3, "/icons/profile-provider-before.svg"),
                ],
              ),
            ),
          ),
        ),
        body: controller.page[controller.selectedNavbar],
      ),
    );
  }

  Widget _navBarIcon(MainProviderController controller, int index, String assetName) {
    return IconButton(
      icon: SvgPicture.asset(
        assetName,
        color: index == controller.selectedNavbar ? primaryColor : disableColor,
        width: 32,
        height: 32,
      ),
      onPressed: () {
        controller.onChangeIndex(index);
      },
    );
  }
}

class _BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double borderRadius = 37;
    const double dipHeight = 45; // seberapa dalam lengkung
    const double dipWidth = 160; // seberapa lebar lengkung

    final path = Path();

    // Kiri atas dengan border radius
    path.moveTo(0, borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);

    // Titik awal sebelum lengkung
    final startX = (size.width - dipWidth) / 2;
    path.lineTo(startX, 0);

    // Lengkung ke bawah (smooth curve turun lalu naik lagi)
    path.cubicTo(
      size.width / 2 - dipWidth / 4, 0, // kontrol kiri (sedikit tarik ke bawah)
      size.width / 2 - dipWidth / 4, dipHeight, // kontrol kiri bawah
      size.width / 2, dipHeight, // titik bawah tengah
    );
    path.cubicTo(
      size.width / 2 + dipWidth / 4, dipHeight, // kontrol kanan bawah
      size.width / 2 + dipWidth / 4, 0, // kontrol kanan
      startX + dipWidth, 0, // titik akhir lengkung
    );

    // Lanjut ke kanan atas dengan border radius
    path.lineTo(size.width - borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);

    // Garis kanan bawah
    path.lineTo(size.width, size.height - borderRadius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - borderRadius, size.height);

    // Garis kiri bawah
    path.lineTo(borderRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - borderRadius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
