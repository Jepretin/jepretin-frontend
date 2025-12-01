import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jepretin/app/data/models/provider_model.dart';
import 'package:jepretin/app/data/models/role_model.dart';
import 'package:jepretin/app/data/request/provider_service.dart';
import 'package:jepretin/app/data/request/user_service.dart';
import 'package:jepretin/app/data/core/helper/token_manager.dart';
import 'package:jepretin/app/data/models/user_model.dart';

class RegisProviderController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController driveLinkController = TextEditingController();

  final isLoading = false.obs;
  final user = Rxn<UserProfileModel>();
  final RxList<RoleModel> availableRoles = <RoleModel>[].obs;
  final RxList<String> selectedRoles = <String>[].obs;
  final Rxn<RegisProviderResponse> providerData = Rxn<RegisProviderResponse>();

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    fetchRoles();
  }

  Future<void> loadUserData() async {
    final cachedUser = await TokenManager.getUser();
    if (cachedUser != null) {
      user.value = UserProfileModel(
        name: cachedUser.name,
        phone: cachedUser.phone,
      );
      print("✅ Data user dimuat: ${user.value?.name} (${user.value?.phone})");
    } else {
      print("⚠️ Tidak ada data user tersimpan");
    }

    final res = await UserService.getProfile();
    res.fold(
      (l) {
        print("❌ Gagal load profile: ${l.message}");
      },
      (r) async {
        print("✅ Berhasil load profile: ${r.data}");
        user.value = r.data;
        // Simpan ke TokenManager lagi (refresh data)
        await TokenManager.saveUser(
          UserModel(
            name: r.data?.name,
            phone: r.data?.phone,
          ),
        );
      },
    );
  }

  Future<void> fetchRoles() async {
    isLoading.value = true;

    final res = await UserService.getRole();

    res.fold(
      (l) {
        isLoading.value = false;
        Get.snackbar("Error", l.message ?? "Gagal memuat daftar role");
      },
      (r) {
        if (r is RoleResponse) {
          availableRoles.assignAll(r.data);
          debugPrint(
              '✅ Roles Loaded dari RoleResponse: ${r.data.map((e) => e.name).join(", ")}');
        }
        // ✅ Kalau BE pakai BaseResponse<RoleModel> tapi isinya list di dalam data
        else if (r.data is List<RoleModel>) {
          availableRoles.assignAll(r.data as List<RoleModel>);
          debugPrint(
              '✅ Roles Loaded dari BaseResponse<List<RoleModel>>: ${availableRoles.map((r) => r.name).join(", ")}');
        } else if (r.data is RoleModel) {
          availableRoles.assignAll([r.data as RoleModel]);
          debugPrint('✅ Role tunggal: ${(r.data as RoleModel).name}');
        }

        // print(
        //     "🎯 Roles Loaded Final: ${availableRoles.map((e) => e.name).join(', ')}");
      },
    );
  }

  void toggleRole(String roleId) {
    if (selectedRoles.contains(roleId)) {
      selectedRoles.remove(roleId);
    } else {
      if (selectedRoles.length < 2) {
        selectedRoles.add(roleId);
      } else {
        Get.snackbar("Batas Maksimal", "Kamu hanya bisa memilih 2 role saja!");
      }
    }
  }

  bool validateInput() {
    if (driveLinkController.text.trim().isEmpty) {
      print("🚫 Validasi gagal: link drive kosong");
      Get.snackbar("Error", "Link Drive wajib diisi!");
      return false;
    }
    if (selectedRoles.isEmpty) {
      print("🚫 Validasi gagal: belum pilih role");
      Get.snackbar("Error", "Pilih minimal satu role!");
      return false;
    }
    print("✅ Validasi lolos");
    return true;
  }

  Future<void> registerProvider() async {
    isLoading.value = true;

    if (!validateInput()) {
      isLoading.value = false; // 👈 ini penting banget
      return;
    }

    print("🌀 Loading dimulai...");

    try {
      final request = RegisProviderRequest(
        experience: driveLinkController.text.trim(),
        roles: selectedRoles.toList(),
      );

      // final res = await ProviderService.registerProvider(request);
      final res = await ProviderService.registerProvider(request)
          .timeout(const Duration(seconds: 10));

      res.fold(
        (l) {
          Get.snackbar(
              "Gagal", l.message ?? "Gagal mendaftar sebagai provider");
        },
        (r) {
          providerData.value = r.data;
          Get.snackbar("Sukses", "Pendaftaran berhasil dikirim!");
          print("📦 RegisProviderResponse: ${r.data?.toJson()}");
        },
      );
    } catch (e) {
      print("❌ Error registerProvider: $e");
      Get.snackbar("Error", "Terjadi kesalahan saat mendaftar.");
    } finally {
      isLoading.value = false;
      print("✅ Loading selesai");
    }
  }

  // Future<void> registerProvider() async {
  //   if (!validateInput()) return;
  //   isLoading.value = true;

  //   try {
  //     final request = RegisProviderRequest(
  //       experience: driveLinkController.text.trim(),
  //       status: "PENDING",
  //       roles: selectedRoles.toList(),
  //     );

  //     print("🚀 Mengirim request register provider: ${request.toJson()}");
  //     final res = await ProviderService.registerProvider(request);
  //     print("🎯 Response register provider diterima");

  //     res.fold(
  //       (l) {
  //         Get.snackbar(
  //             "Gagal", l.message ?? "Gagal mendaftar sebagai provider");
  //       },
  //       (r) {
  //         providerData.value = r.data;
  //         Get.snackbar("Sukses",
  //             "Pendaftaran berhasil dikirim! Tunggu verifikasi admin.");
  //         print("📦 RegisProviderResponse: ${r.data?.toJson()}");
  //       },
  //     );
  //   } catch (e) {
  //     print("❌ Error registerProvider: $e");
  //     Get.snackbar("Error", "Terjadi kesalahan saat mendaftar.");
  //   } finally {
  //     // ✅ Selalu matikan loading
  //     isLoading.value = false;
  //   }
  // }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    driveLinkController.dispose();
    super.onClose();
  }
}
