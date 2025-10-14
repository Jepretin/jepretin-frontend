class ApiEndpoint {
  static String login = "auth/login";
  static String register = "auth/register";
  static String verifyOtp = "auth/otp/verify";
  static String logout = "main";

  static String getUser = "user/get-user";
  static String putProfileUser = "user/update-user";

  static String getProvider = "providers/get-provider";
  static String postProvider = "provider/provider";

  // Contoh untuk penggunaan id dan page
  // static String userRegister({required String id}) => "tiket/mountain/$id/detail";
  // static String getListMountain({required int page}) => "tiket/mountain?page=$page";
}
