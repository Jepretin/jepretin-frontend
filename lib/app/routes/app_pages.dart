import 'package:get/get.dart';

import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/otp/bindings/otp_binding.dart';
import '../modules/auth/otp/views/otp_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/menu-navbar/help/bindings/help_binding.dart';
import '../modules/menu-navbar/help/views/help_view.dart';
import '../modules/menu-navbar/home/bindings/home_binding.dart';
import '../modules/menu-navbar/home/views/home_view.dart';
import '../modules/menu-navbar/promotion/bindings/promotion_binding.dart';
import '../modules/menu-navbar/promotion/views/promotion_view.dart';
import '../modules/menu-navbar/transaction/cart/bindings/cart_binding.dart';
import '../modules/menu-navbar/transaction/cart/views/cart_view.dart';
import '../modules/menu-navbar/transaction/confirm_pembayaran/bindings/confirm_pembayaran_binding.dart';
import '../modules/menu-navbar/transaction/confirm_pembayaran/views/confirm_pembayaran_view.dart';
import '../modules/menu-navbar/transaction/history_transaction/bindings/history_transaction_binding.dart';
import '../modules/menu-navbar/transaction/history_transaction/views/history_transaction_view.dart';
import '../modules/menu-navbar/transaction/metode_pembayaran/bindings/metode_pembayaran_binding.dart';
import '../modules/menu-navbar/transaction/metode_pembayaran/views/metode_pembayaran_view.dart';
import '../modules/menu-navbar/transaction/order/bindings/order_binding.dart';
import '../modules/menu-navbar/transaction/order/views/order_view.dart';
import '../modules/user/customer/menu_profile/address/bindings/address_binding.dart';
import '../modules/user/customer/menu_profile/address/views/address_view.dart';
import '../modules/user/customer/menu_profile/favorite/bindings/favorite_binding.dart';
import '../modules/user/customer/menu_profile/favorite/views/favorite_view.dart';
import '../modules/user/customer/menu_profile/notification/bindings/notification_binding.dart';
import '../modules/user/customer/menu_profile/notification/views/notification_view.dart';
import '../modules/user/customer/menu_profile/policy/bindings/policy_binding.dart';
import '../modules/user/customer/menu_profile/policy/views/policy_view.dart';
import '../modules/user/customer/menu_profile/profile_edit/bindings/profile_edit_binding.dart';
import '../modules/user/customer/menu_profile/profile_edit/views/profile_edit_view.dart';
import '../modules/user/customer/menu_profile/regis_provider/bindings/regis_provider_binding.dart';
import '../modules/user/customer/menu_profile/regis_provider/views/regis_provider_view.dart';
import '../modules/user/customer/menu_profile/report/bindings/report_binding.dart';
import '../modules/user/customer/menu_profile/report/views/report_view.dart';
import '../modules/user/customer/menu_profile/settings/bindings/settings_binding.dart';
import '../modules/user/customer/menu_profile/settings/views/settings_view.dart';
import '../modules/user/customer/menu_profile/term/bindings/term_binding.dart';
import '../modules/user/customer/menu_profile/term/views/term_view.dart';
import '../modules/user/customer/profile/bindings/profile_binding.dart';
import '../modules/user/customer/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // Untuk tes ganti dot setelah routes, contoh: Routes.HOME -> ini sebagai defauld
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_TRANSACTION,
      page: () => const HistoryTransactionView(),
      binding: HistoryTransactionBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.PROMOTION,
      page: () => const PromotionView(),
      binding: PromotionBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_PEMBAYARAN,
      page: () => const ConfirmPembayaranView(),
      binding: ConfirmPembayaranBinding(),
    ),
    GetPage(
      name: _Paths.METODE_PEMBAYARAN,
      page: () => const MetodePembayaranView(),
      binding: MetodePembayaranBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS,
      page: () => const AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.REGIS_PROVIDER,
      page: () => const RegisProviderView(),
      binding: RegisProviderBinding(),
    ),
    GetPage(
      name: _Paths.POLICY,
      page: () => const PolicyView(),
      binding: PolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERM,
      page: () => const TermView(),
      binding: TermBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_EDIT,
      page: () => const ProfileEditView(),
      binding: ProfileEditBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
