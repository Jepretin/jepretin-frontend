import 'package:get/get.dart';
import 'package:jepretin/app/modules/user/customer/profile/bindings/profile_binding.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/otp/bindings/otp_binding.dart';
import '../modules/auth/otp/views/otp_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/help/bindings/help_binding.dart';
import '../modules/help/views/help_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/promotion/bindings/promotion_binding.dart';
import '../modules/promotion/views/promotion_view.dart';
import '../modules/transaction/cart/bindings/cart_binding.dart';
import '../modules/transaction/cart/views/cart_view.dart';
import '../modules/transaction/history_transaction/bindings/history_transaction_binding.dart';
import '../modules/transaction/history_transaction/views/history_transaction_view.dart';
import '../modules/transaction/order/bindings/order_binding.dart';
import '../modules/transaction/order/views/order_view.dart';
import '../modules/user/customer/profile/controllers/profile_controller.dart';
import '../modules/user/customer/profile/views/profile_view.dart';
import '../modules/user/customer/profile_edit/bindings/profile_edit_binding.dart';
import '../modules/user/customer/profile_edit/views/profile_edit_view.dart';
import '../modules/user/customer/favorite/bindings/favorite_binding.dart';
import '../modules/user/customer/favorite/views/favorite_view.dart';

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
      name: _Paths.PROFILE_EDIT,
      page: () => const ProfileEditView(),
      binding: ProfileBinding(),
    ),
  ];
}
