import 'package:get/get.dart';

import '../controllers/order_history_asm_controller.dart';

class OrderHistoryAsmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderHistoryAsmController>(
      () => OrderHistoryAsmController(),
    );
  }
}
