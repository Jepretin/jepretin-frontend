import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jepretin/app/data/core/helper/token_manager.dart';
import 'package:jepretin/app/data/models/user_model.dart';
import 'package:jepretin/app/data/request/user_service.dart';

class ProfileEditController extends GetxController {
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  final user = Rxn<UserProfileModel>();
  final uavatar = Rxn<UpdateAvatarModel>();
  final isLoading = false.obs;

  final Rx<File?> selectedMedia = Rx<File?>(null);
  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();

    checkToken();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    isLoading.value = true;

    final loggedIn = await TokenManager.isLoggedIn();
    if (!loggedIn) {
      isLoading.value = false;
      print("🚫 User belum login, profile tidak di-load");
      return;
    }

    // ✅ Load dari TokenManager (cached user)
    final cachedUser = await TokenManager.getUser();
    if (cachedUser != null) {
      user.value = UserProfileModel(
        id: cachedUser.id,
        email: cachedUser.email,
        name: cachedUser.email?.split('@').first ?? 'Guest',
        role: cachedUser.role,
      );
    }

    // ✅ Fetch dari API (update terbaru)
    final res = await UserService.getProfile();
    res.fold(
      (l) {
        print("❌ Gagal load profile: ${l.message}");
      },
      (r) async {
        print("✅ Berhasil load profile: ${r.data}");
        user.value = r.data;
        // Simpan ke TokenManager lagi (refresh data)
        await TokenManager.saveUser(UserModel(
          id: r.data?.id,
          email: r.data?.email,
          role: r.data?.role,
        ));
      },
    );

    isLoading.value = false;
  }

  void checkToken() async {
    final token = await TokenManager.getToken();
    print("🔥 TOKEN SEKARANG: $token");
  }

  // Update nama/email
  Future<void> updateProfile({String? name, String? email}) async {
    if (user.value?.id == null) {
      Get.snackbar("Error", "User ID tidak ditemukan");
      return;
    }

    isLoading.value = true;

    final request = UpdateProfileModel(
      name: name,
      email: email,
    );

    try {
      final res = await UserService.putProfile(request: request);

      res.fold(
        (l) => Get.snackbar("Update Gagal", l.message ?? "Terjadi kesalahan"),
        (r) {
          if (name != null) Get.snackbar("Sukses", "Nama berhasil diperbarui");
          if (email != null)
            Get.snackbar("Sukses", "Email berhasil diperbarui");
        },
      );
    } catch (e) {
      Get.snackbar("Update Gagal", "Terjadi kesalahan jaringan/server");
    }

    isLoading.value = false;
  }

  Future<void> pickMedia({required String source}) async {
    XFile? file;
    if (source == 'camera') {
      file = await picker.pickImage(source: ImageSource.camera);
    } else if (source == 'gallery') {
      file = await picker.pickImage(source: ImageSource.gallery);
    }

    if (file != null) {
      uavatar.value =
          UpdateAvatarModel(avatarBase64: file.path); // pastikan ini dijalankan
    }
  }

  Future<void> uploadAvatar() async {
    if (uavatar.value?.avatarBase64 == null) {
      Get.snackbar("Gagal", "Pilih foto terlebih dahulu");
      print("DEBUG: file dipilih => ${uavatar.value?.avatarBase64}");
      return;
    }

    isLoading.value = true;

    try {
      final filePath = uavatar.value!.avatarBase64!;
      final res = await UserService.uploadAvatar(filePath: filePath);

      res.fold(
        (l) => Get.snackbar("Gagal", l.message ?? "Upload gagal"),
        (url) {
          uavatar.value = uavatar.value!.copyWith(avatarBase64: url);
          Get.snackbar("Sukses", "Foto profil berhasil diperbarui ✅");
        },
      );
    } catch (e) {
      Get.snackbar("Gagal", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> uploadAvatar() async {
  //   if (selectedMedia.value == null) {
  //     Get.snackbar("Gagal", "Pilih foto terlebih dahulu");
  //     return;
  //   }

  //   try {
  //     isLoading.value = true;

  //     final filePath = selectedMedia.value!.path;
  //     final res = await UserService.uploadAvatar(filePath: filePath);

  //     res.fold(
  //       (l) {
  //         Get.snackbar("Gagal", l.message ?? "Terjadi kesalahan");
  //         print("❌ Upload avatar gagal: ${l.message}");
  //       },
  //       (url) {
  //         // Update user di ProfileController
  //         final profileController = Get.find<ProfileEditController>();
  //         profileController.uavatar.value =
  //             profileController.uavatar.value!.copyWith(avatarBase64: url);

  //         Get.snackbar("Sukses", "Foto profil berhasil diperbarui ✅");
  //         print("✅ Avatar URL: $url");

  //         selectedMedia.value = null; // reset file
  //       },
  //     );
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
