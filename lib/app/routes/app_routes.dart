part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const LOGIN = _Paths.AUTH + _Paths.LOGIN;
  static const REGISTER = _Paths.AUTH + _Paths.REGISTER;
  static const FORGOT_PASSWORD = _Paths.AUTH + _Paths.FORGOT_PASSWORD;
  static const MAIN = _Paths.MAIN;
}

abstract class _Paths {
  _Paths._();

  // Folder
  static const AUTH = '/auth';

  // File
  static const HOME = '/home';
  static const ONBOARDING = '/onboarding';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const MAIN = '/main';
}
