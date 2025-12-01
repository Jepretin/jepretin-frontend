import 'package:get/get.dart';

import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/otp/bindings/otp_binding.dart';
import '../modules/auth/otp/views/otp_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/navigation/user_nav/bindings/user_nav_binding.dart';
import '../modules/navigation/user_nav/views/user_nav_view.dart';
import '../modules/user/help/bindings/help_binding.dart';
import '../modules/user/help/views/help_view.dart';
import '../modules/user/home/bindings/home_binding.dart';
import '../modules/user/home/views/home_view.dart';
import '../modules/user/promotion/bindings/promotion_binding.dart';
import '../modules/user/promotion/views/promotion_view.dart';
import '../modules/user/home_submenu/cart/bindings/cart_binding.dart';
import '../modules/user/home_submenu/cart/views/cart_view.dart';
import '../modules/user/transaction/payment/confirm/bindings/confirm_binding.dart';
import '../modules/user/transaction/payment/confirm/views/confirm_view.dart';
import '../modules/user/transaction/history/bindings/history_transaction_binding.dart';
import '../modules/user/transaction/history/views/history_transaction_view.dart';
import '../modules/user/transaction/payment/method/bindings/method_binding.dart';
import '../modules/user/transaction/payment/method/views/method_view.dart';
import '../modules/user/order/bindings/order_binding.dart';
import '../modules/user/order/views/order_view.dart';
import '../modules/user/transaction/review/bindings/review_binding.dart';
import '../modules/user/transaction/review/views/review_view.dart';
import '../modules/user/home_submenu/profile_submenu/address/bindings/address_binding.dart';
import '../modules/user/home_submenu/profile_submenu/address/views/address_view.dart';
import '../modules/user/home_submenu/profile_submenu/favorite/bindings/favorite_binding.dart';
import '../modules/user/home_submenu/profile_submenu/favorite/views/favorite_view.dart';
import '../modules/user/home_submenu/profile_submenu/notification/bindings/notification_binding.dart';
import '../modules/user/home_submenu/profile_submenu/notification/views/notification_view.dart';
import '../modules/user/home_submenu/profile_submenu/policy/bindings/policy_binding.dart';
import '../modules/user/home_submenu/profile_submenu/policy/views/policy_view.dart';
import '../modules/user/home_submenu/profile_submenu/profile_edit/bindings/profile_edit_binding.dart';
import '../modules/user/home_submenu/profile_submenu/profile_edit/views/profile_edit_view.dart';
import '../modules/user/home_submenu/profile_submenu/regis_provider/bindings/regis_provider_binding.dart';
import '../modules/user/home_submenu/profile_submenu/regis_provider/views/regis_provider_view.dart';
import '../modules/user/home_submenu/profile_submenu/report/bindings/report_binding.dart';
import '../modules/user/home_submenu/profile_submenu/report/views/report_view.dart';
import '../modules/user/home_submenu/profile_submenu/settings/bindings/settings_binding.dart';
import '../modules/user/home_submenu/profile_submenu/settings/views/settings_view.dart';
import '../modules/user/home_submenu/profile_submenu/term/bindings/term_binding.dart';
import '../modules/user/home_submenu/profile_submenu/term/views/term_view.dart';
import '../modules/user/home_submenu/profile/bindings/profile_binding.dart';
import '../modules/user/home_submenu/profile/views/profile_view.dart';
import '../modules/provider/home/bindings/home_provider_binding.dart';
import '../modules/provider/home/views/home_provider_view.dart';
import '../modules/provider/offers/bindings/offers_binding.dart';
import '../modules/provider/offers/views/offers_view.dart';
import '../modules/navigation/provider_nav/bindings/provider_nav_binding.dart';
import '../modules/navigation/provider_nav/views/provider_nav_view.dart';
import '../modules/provider/manage_orders/bindings/manage_orders_binding.dart';
import '../modules/provider/manage_orders/views/manage_orders_view.dart';
import '../modules/provider/profile_provider/bindings/profile_provider_binding.dart';
import '../modules/provider/profile_provider/views/profile_provider_view.dart';
import '../modules/provider/upload_portfolio/bindings/upload_portfolio_binding.dart';
import '../modules/provider/upload_portfolio/views/upload_portfolio_view.dart';

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
      page: () => const UserNavView(),
      binding: UserNavBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER,
      page: () => const ProviderNavView(),
      binding: ProviderNavBinding(),
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
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
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
      name: _Paths.CONFIRM_PAYMENT,
      page: () => const ConfirmView(),
      binding: ConfirmBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_METHOD,
      page: () => const MethodView(),
      binding: MethodBinding(),
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
    GetPage(
      name: _Paths.REVIEW,
      page: () => const ReviewView(),
      binding: ReviewBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PROVIDER,
      page: () => const HomeProviderView(),
      binding: HomeProviderBinding(),
    ),
    GetPage(
      name: _Paths.MANAGEORDERS,
      page: () => const ManageOrdersView(),
      binding: ManageOrdersBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_PORTFOLIO,
      page: () => const UploadPortfolioView(),
      binding: UploadPortfolioBinding(),
    ),
    GetPage(
      name: _Paths.OFFERS,
      page: () => const OffersView(),
      binding: OffersBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PROVIDER,
      page: () => const ProfileProviderView(),
      binding: ProfileProviderBinding(),
    ),
  ];
}
