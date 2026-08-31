class ApiEndpoints {
  // Ganti dengan URL Backend kamu nanti. 
  // Kalau pakai localhost emulator Android, gunakan 10.0.2.2
  static const String baseUrl = "https://api.jepretin.com/v1"; 

  // --- AUTH ENDPOINTS ---
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  
  // --- USER / PHOTOGRAPHER ENDPOINTS ---
  static const String getProfile = "$baseUrl/users/profile";
  static const String getPhotographers = "$baseUrl/photographers";
}