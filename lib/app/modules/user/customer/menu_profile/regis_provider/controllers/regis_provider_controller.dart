import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/data/models/provider_model.dart';
import 'package:jepretin/app/data/request/provider_service.dart';

class RegisProviderController extends GetxController {
  /// 🔹 Controller untuk TextField
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController driveLinkController = TextEditingController();

  /// 🔹 Role yang tersedia (disesuaikan kebutuhan)
  final List<String> availableRoles = ["Photographer", "Videographer", "Editor"];

  /// 🔹 Role yang dipilih user (max 2)
  final RxList<String> selectedRoles = <String>[].obs;

  /// 🔹 State management
  final RxBool isLoading = false.obs;

  /// 🔹 Data provider yang sudah terdaftar (kalau ada)
  final Rxn<RegisProviderResponse> providerData = Rxn<RegisProviderResponse>();

  /// ✅ Toggle role (maksimal 2)
  void toggleRole(String role) {
    if (selectedRoles.contains(role)) {
      selectedRoles.remove(role);
    } else {
      if (selectedRoles.length < 2) {
        selectedRoles.add(role);
      } else {
        Get.snackbar("Batas Maksimal", "Kamu hanya bisa memilih 2 role saja!");
      }
    }
  }

  /// ✅ Validasi input
  bool validateInput() {
    if (nameController.text.trim().isEmpty) {
      Get.snackbar("Error", "Nama lengkap wajib diisi!");
      return false;
    }
    if (phoneController.text.trim().isEmpty) {
      Get.snackbar("Error", "Nomor WhatsApp wajib diisi!");
      return false;
    }
    if (driveLinkController.text.trim().isEmpty) {
      Get.snackbar("Error", "Link Drive wajib diisi!");
      return false;
    }
    if (selectedRoles.isEmpty) {
      Get.snackbar("Error", "Pilih minimal satu role!");
      return false;
    }
    return true;
  }

  /// ✅ POST Register Provider
  Future<void> registerProvider() async {
    if (!validateInput()) return;

    isLoading.value = true;

    final request = RegisProviderRequest(
      experience: driveLinkController.text.trim(),
      status: "PENDING", 
      roles: selectedRoles.toList(),
    );

    final res = await ProviderService.registerProvider(request);

    res.fold(
      (l) {
        Get.snackbar("Gagal", l.message ?? "Gagal mendaftar sebagai provider");
      },
      (r) {
        providerData.value = r.data;
        Get.snackbar("Sukses", "Pendaftaran berhasil dikirim! Tunggu verifikasi admin.");
        print("📦 RegisProviderResponse: ${r.data?.toJson()}");
      },
    );

    isLoading.value = false;
  }

  /// ✅ GET Data Provider yang sudah ada
  Future<void> getProviderData() async {
    isLoading.value = true;

    final res = await ProviderService.getProvider();

    res.fold(
      (l) {
        Get.snackbar("Error", l.message ?? "Gagal memuat data provider");
      },
      (r) {
        providerData.value = r.data;
        print("📥 Data Provider: ${r.data?.toJson()}");
      },
    );

    isLoading.value = false;
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    driveLinkController.dispose();
    super.onClose();
  }
}
