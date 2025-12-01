import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/themes/themes.dart';

import '../controllers/home_provider_controller.dart';

class HomeProviderView extends GetView<HomeProviderController> {
  const HomeProviderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 80),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('images/monyet.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hey! Gilga 👋",
                        style: styletext(
                          fontsize: 16,
                          fontWeight: bold,
                          color: textInputColor,
                        ),
                      ),
                      Text(
                        "segi22@gmail.com",
                        style: styletext(
                          fontsize: 12,
                          fontWeight: light,
                          color: textInputColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  _topIconComponent(
                    onTap: () => {},
                    icon: Icons.notifications_none_sharp,
                  ),
                  _topIconComponent(
                    onTap: () => {},
                    icon: Icons.logout,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: GetBuilder(
        init: HomeProviderController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          child: Column(
            children: [
              const SizedBox(height: 25),

              // --- Kalender Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.calendar_month_outlined, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "Kalender Saya",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Image.asset('images/contoh.png')
                    // TableCalendar(
                    //   focusedDay: DateTime.now(),
                    //   firstDay: DateTime(2010),
                    //   lastDay: DateTime(2030),
                    //   headerStyle: const HeaderStyle(
                    //     formatButtonVisible: false,
                    //     titleCentered: true,
                    //   ),
                    // ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // --- Statistik Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard(
                    title: "Total Pemesanan",
                    value: "1k",
                    subtitle: "Customers",
                    changeText: "+5% dari kemarin",
                    icon: Icons.people_outline,
                  ),
                  _buildStatCard(
                    title: "Pesanan Masuk",
                    value: "100",
                    subtitle: "Customers",
                    changeText: "+5% dari kemarin",
                    icon: Icons.shopping_cart_outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
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

Widget _buildStatCard({
  required String title,
  required String value,
  required String subtitle,
  required String changeText,
  required IconData icon,
}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black54),
              const SizedBox(width: 8),
              Expanded(
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(value,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 6),
          Text(changeText,
              style: const TextStyle(color: Colors.green, fontSize: 12)),
        ],
      ),
    ),
  );
}
