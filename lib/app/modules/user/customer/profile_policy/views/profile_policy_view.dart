import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_policy_controller.dart';
import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';

class ProfilePolicyView extends GetView<ProfilePolicyController> {
  const ProfilePolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kebijakan'),
          centerTitle: true,
        ),
        body: GetBuilder(
            init: ProfilePolicyController(),
            builder: (controller) => SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    children: [
                      InputWithLabel(
                          label: 'Kebijakan',
                          input: CustomCardSingle(
                              child: Row(
                            children: [
                              Text(
                                "Kebijakan Privasi (Dummy)\n\n"
                                "Aplikasi ini dibuat hanya untuk keperluan pembelajaran. "
                                "Kami tidak mengumpulkan, menyimpan, atau membagikan data pribadi Anda.\n\n"
                                "Dengan menggunakan aplikasi ini, Anda menyetujui bahwa segala bentuk data "
                                "yang ditampilkan hanyalah contoh (dummy) dan tidak memiliki implikasi hukum.\n\n"
                                "Kebijakan ini dapat berubah sewaktu-waktu tanpa pemberitahuan sebelumnya.",
                              )
                            ],
                          )))
                    ],
                  ),
                )));
  }
}
