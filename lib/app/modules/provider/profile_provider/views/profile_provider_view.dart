import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_provider_controller.dart';

class ProfileProviderView extends GetView<ProfileProviderController> {
  const ProfileProviderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileProviderView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        init: ProfileProviderController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
          child : Column(
            children: [
              // HEADER (BACKGROUND BIRU + PROFIL)
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF083A5B),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      // FOTO PROFIL
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/profile.jpg"), // contoh
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // NAMA + BADGE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Sepuh Gila",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.verified,
                              color: Colors.blueAccent, size: 20),
                        ],
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        "seg12@gmail.com",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // TAB MENU (Rating, Completed, Active, Area)
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _tabItem("Rating"),
                    _tabItem("Completed"),
                    _tabItem("Active"),
                    _tabItem("Area"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // MENU CARD
              _menuCard(
                icon: Icons.account_balance_wallet_outlined,
                title: "Wallet & Earnings",
                subtitle: "View your income and balance",
                onTap: () {},
              ),
              _menuCard(
                icon: Icons.person_outline,
                title: "Edit Profile",
                subtitle: "Update personal information",
                onTap: () {},
              ),
              _menuCard(
                icon: Icons.map_outlined,
                title: "Service Covarage",
                subtitle: "Manage delivery area",
                onTap: () {},
              ),
              _menuCard(
                icon: Icons.grid_view_outlined,
                title: "Manage Posts",
                subtitle: "Your products and listings",
                onTap: () {},
              ),
              _menuCard(
                icon: Icons.list_alt_outlined,
                title: "Manage Topping & Bundle",
                subtitle: "Configure product options",
                onTap: () {},
              ),
              _menuCard(
                icon: Icons.access_time_outlined,
                title: "Schedule",
                subtitle: "Set availability and hours",
                onTap: () {},
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _tabItem(String title) {
  return Expanded(
    child: Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

Widget _menuCard({
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(bottom: 14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F1F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.black54),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black45),
        ],
      ),
    ),
  );
}
