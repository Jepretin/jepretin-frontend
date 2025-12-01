import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:jepretin/app/shared/customCardContent.dart';
import 'package:jepretin/app/shared/customComponent.dart';
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
      body: Obx(
        () {
          final tes = controller.user.value;
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (tes == null) {
            return const Center(child: Text("Belum ada data user"));
          }
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Center(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomCardMultiple(
                        children: [
                          CustomMenu(
                            leadingIcon: Icons.photo_camera,
                            placeholder: 'Foto Profil',
                            trailingIcon: Icons.chevron_right,
                            onTap: () async {
                              final avatarController =
                                  Get.put(ProfileEditController());

                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) {
                                  return _userChangeFotoProfile(
                                    onClose: () => Navigator.of(context).pop(),
                                    onSelect: (choice) async {
                                      Navigator.of(context)
                                          .pop(); // tutup dialog dulu

                                      // Ambil file sesuai pilihan
                                      if (choice == "gallery") {
                                        await avatarController.pickMedia(
                                            source: "gallery");
                                      } else if (choice == "camera") {
                                        await avatarController.pickMedia(
                                            source: "camera");
                                      }

                                      // Upload avatar ke backend
                                      await avatarController.uploadAvatar();
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(height: 20),
                          CustomMenu(
                            leadingIcon: Icons.person,
                            placeholder: (tes.name?.isNotEmpty ?? false)
                                ? tes.name!
                                : (tes.email?.split('@').first ?? "Tanpa Nama"),
                            trailingIcon: Icons.chevron_right,
                            onTap: () async {
                              final profileController =
                                  Get.find<ProfileEditController>();
                              final newName =
                                  await Navigator.of(context).push<String>(
                                MaterialPageRoute(
                                  builder: (_) => UserEditFieldPage(
                                    label: "Nama",
                                    initialValue:
                                        profileController.user.value?.name ??
                                            "",
                                  ),
                                ),
                              );

                              if (newName != null)
                                await profileController.updateProfile(
                                    name: newName);
                            },
                          ),
                          SizedBox(height: 20),
                          CustomMenu(
                            leadingIcon: Icons.email,
                            placeholder: tes.email ?? "Tanpa Email",
                            trailingIcon: Icons.chevron_right,
                            onTap: () async {
                              final profileController =
                                  Get.find<ProfileEditController>();
                              final newEmail =
                                  await Navigator.of(context).push<String>(
                                MaterialPageRoute(
                                  builder: (_) => UserEditFieldPage(
                                    label: "Email",
                                    initialValue:
                                        profileController.user.value?.email ??
                                            "",
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              );

                              if (newEmail != null)
                                await profileController.updateProfile(
                                    email: newEmail);
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _userChangeFotoProfile({
  required VoidCallback onClose,
  required void Function(String) onSelect, // mengirim pilihan
}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30), // space supaya X tidak menimpa title
              const Text(
                "Ganti Foto Profil",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Pilihan list
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Pilih dari Galeri"),
                onTap: () => onSelect("gallery"),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Ambil Foto"),
                onTap: () => onSelect("camera"),
              ),
            ],
          ),
        ),

        // Tombol X di pojok kanan atas
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: onClose,
          ),
        ),
      ],
    ),
  );
}

class UserEditFieldPage extends StatefulWidget {
  final String label;
  final String initialValue;
  final TextInputType keyboardType;

  const UserEditFieldPage({
    super.key,
    required this.label,
    required this.initialValue,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<UserEditFieldPage> createState() => _UserEditFieldPageState();
}

class _UserEditFieldPageState extends State<UserEditFieldPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah ${widget.label}"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(), // tutup tanpa simpan
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                labelText: widget.label,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(_controller.text); // kembalikan nilai baru
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
