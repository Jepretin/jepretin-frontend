class AuthValidator {
  static bool isLoginValid(String email, String password) {
    if (email.isEmpty || password.isEmpty) return false;
    if (!email.contains('@')) return false;
    if (password.length < 6) return false;
    return true;
  }

  static bool isRegisterValid(
      String email, String password, String phone) {
    if (email.isEmpty || password.isEmpty || phone.isEmpty) return false;
    if (!email.contains('@')) return false;
    if (!phone.startsWith('08')) return false;
    return true;
  }
}
