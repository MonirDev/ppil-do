import 'package:get/get.dart';

import '../modules/create_order/bindings/create_order_binding.dart';
import '../modules/create_order/views/create_order_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/order_history/bindings/order_history_binding.dart';
import '../modules/order_history/views/order_history_view.dart';
import '../modules/order_history_asm/bindings/order_history_asm_binding.dart';
import '../modules/order_history_asm/views/order_history_asm_view.dart';
import '../modules/pdf_view/bindings/pdf_view_binding.dart';
import '../modules/pdf_view/views/pdf_view_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.createOrder,
      page: () => CreateOrderView(),
      binding: CreateOrderBinding(),
    ),
    GetPage(
      name: _Paths.orderHistory,
      page: () => OrderHistoryView(),
      binding: OrderHistoryBinding(),
    ),
    GetPage(
      name: _Paths.pdf_view,
      page: () => const PdfViewView(),
      binding: PdfViewBinding(),
    ),
    GetPage(
      name: _Paths.orderHistoryAsm,
      page: () => OrderHistoryAsmView(),
      binding: OrderHistoryAsmBinding(),
    ),
  ];
}
