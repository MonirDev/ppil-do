import 'package:get/get.dart';
import 'package:ppildo/app/modules/create_order/controllers/create_order_controller.dart';
import 'package:ppildo/app/utils/constants.dart';

class OrderValidation {
  final CreateOrderController controller = Get.find<CreateOrderController>();
  validateOrder() {
    try {
      if (controller.selectedCustomerName.value.isEmpty) {
        throw Constants.selectCustomer;
      } else if (controller.selectedSubCustomerName.value.isEmpty) {
        throw Constants.selectSubCustomer;
      } else if (controller.selectedProductCode.value.isEmpty) {
        throw Constants.selectProduct;
      } else if (controller.selectedProductList.isEmpty) {
        throw Constants.addProductToorder;
      } else if (controller
          .selectSaleDateTextEditingController.value.text.isEmpty) {
        throw Constants.selectSaleDate;
      } else if (controller
          .deliveryAddressTextEditingController.value.text.isEmpty) {
        throw Constants.enterDeliveryAddress;
      } else if (controller
          .deliveryMNoTextEditingController.value.text.isEmpty) {
        throw Constants.enterDeliveryMobileNo;
      } else if (controller
          .deliveryDateTextEditingController.value.text.isEmpty) {
        throw "${Constants.select} ${Constants.deliveryDate}";
      } else if (controller.notesTextEditingController.value.text.isEmpty) {
        throw Constants.writeNotes;
      } else if (controller.modeOfPayment.value.isEmpty) {
        throw "${Constants.select} ${Constants.modeOfPayment}";
      } else {
        return "";
      }
    } catch (e) {
      rethrow;
    }
  }
}
