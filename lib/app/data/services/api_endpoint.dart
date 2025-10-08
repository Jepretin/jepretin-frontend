class ApiEndpoint {
  static String login = "auth/login";
  static String register = "auth/register";
  static String verifyOtp = "/auth/otp/verify";
  static String forgotPassword = "/auth/forgot-password";

  // Contoh untuk penggunaan id dan page
  // static String userRegister({required String id}) => "tiket/mountain/$id/detail";
  // static String getListMountain({required int page}) => "tiket/mountain?page=$page";
}
