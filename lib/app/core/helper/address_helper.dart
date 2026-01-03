// import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jepretin/app/data/models/territory_model.dart';
import 'package:jepretin/app/shared/customComponent.dart';

enum AddressLevel { province, regency, district, village }

String formatAddressHierarchy(AddressModel addr) {
  final province = addr.village?.district?.regency?.province?.name ?? '-';
  final regency = addr.village?.district?.regency?.name ?? '-';
  final district = addr.village?.district?.name ?? '-';
  final village = addr.village?.name ?? '-';

  return "$province, $regency, $district, $village";
}

class AddressHelper {
  static TextEditingController getController(
      AddressLevel level, AddressSelectable h) {
    switch (level) {
      case AddressLevel.province:
        return h.provinceController;
      case AddressLevel.regency:
        return h.regencyController;
      case AddressLevel.district:
        return h.districtController;
      case AddressLevel.village:
        return h.villageController;
    }
  }

  /// Generic search by level
  static Future<List<dynamic>> search(
    AddressLevel level,
    String query,
    AddressSelectable handler,
  ) {
    switch (level) {
      case AddressLevel.province:
        return handler.searchProvinces(query);

      case AddressLevel.regency:
        return handler.searchRegencies(query);

      case AddressLevel.district:
        return handler.searchDistricts(query);

      case AddressLevel.village:
        return handler.searchVillages(query);
    }
  }

  /// Generic select by level
  static void select(
    AddressLevel level,
    dynamic item, {
    required Function(ProvinceModel) onProvince,
    required Function(RegencyModel) onRegency,
    required Function(DistrictModel) onDistrict,
    required Function(VillageModel) onVillage,
  }) {
    switch (level) {
      case AddressLevel.province:
        onProvince(item as ProvinceModel);
        break;
      case AddressLevel.regency:
        onRegency(item as RegencyModel);
        break;
      case AddressLevel.district:
        onDistrict(item as DistrictModel);
        break;
      case AddressLevel.village:
        onVillage(item as VillageModel);
        break;
    }
  }
}
