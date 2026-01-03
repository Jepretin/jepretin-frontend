class ApiEndpoint {
  static String login = "auth/login";
  static String register = "auth/register";
  static String verifyOtp = "auth/otp/verify";
  static String logout = "main";

  static String getUser = "user/get-user";
  static String putProfileUser = "user/update-user";

  static String postAddress = "user/address";
  static String getAllAddress = "user/address"; // Mengambil semua address
  static String getAddressID({required String addressId}) => "user/address/$addressId"; // Mengambil salah satu address berdasarkan ID address
  // static String putAddress = "user/address/{addressId}"; 
  static String putAddress({required String addressId}) => "user/address/$addressId"; 
  static String deleteAddress = "user/address/{id}"; 

  static String getCoverage({required String districtId}) => "provider/coverage/$districtId";

  static String getRole = "provider/roles";
  static String getProvider = "providers/get-provider";
  static String postProvider = "provider/provider";
  static String postPortofolioProvider = "provider/portofolio";

  static String getProvinces = "wilayah/provinces";
  static String getRegencies({required String provinceId}) => "wilayah/regencies/$provinceId";
  static String getDistricts({required String regencyId}) => "wilayah/districts/$regencyId";
  static String getVillages({required String districtId}) => "wilayah/villages/$districtId";

  // Contoh untuk penggunaan id dan page
  // static String userRegister({required String id}) => "tiket/mountain/$id/detail";
  // static String getListMountain({required int page}) => "tiket/mountain?page=$page";
}
