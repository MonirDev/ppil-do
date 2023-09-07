import 'dart:developer';

import 'package:get/get.dart';
import 'package:ppildo/app/common/widgets/common_widget.dart';
import 'package:ppildo/app/data/repository/customer_repository.dart';
import 'package:ppildo/app/modules/create_order/controllers/create_order_controller.dart';
import 'package:ppildo/app/modules/order_history/controllers/order_history_controller.dart';
import 'package:ppildo/app/routes/app_pages.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with StateMixin {
  var userName = "".obs;
  late SharedPreferences pref;
  var isMr = true.obs;
  var isLoading = false.obs;

  //Put repository
  final CustomerRepository _customerRepository = Get.put(CustomerRepository());

  @override
  void onInit() async {
    pref = await SharedPreferences.getInstance();
    userName.value = pref.getString(Constants.userName) ?? "";
    getuserInfo(userName.value);
    super.onInit();
  }

//go to CreateOrder Page
  goToCreateOrderpage() {
    Get.delete<CreateOrderController>();
    Get.put(CreateOrderController());
    Get.toNamed(Routes.createOrder);
  }

//go to OrderHistory Page
  goToOrderHistorypage() {
    Get.delete<OrderHistoryController>();
    Get.put(OrderHistoryController());
    Get.toNamed(Routes.orderHistory);
  }

//Call User modules
  Future<void> getuserInfo(String userName) async {
    isLoading(true);
    try {
      await _customerRepository.getUserInfo(userName).then(
        (value) async {
          isMr.value = value.userModulesList
              .any((element) => element.title == Constants.mrTypeString);
          isLoading(false);
        },
      );
    } catch (e) {
      isLoading(false);
      CommonWidget.responseErrorPopUp(e.toString(), () {
        if (e.toString() != Constants.tokenExpired) getuserInfo(userName);
      });
      log("UserModules Api error");
    }
  }

  //call logout
  logout() {
    CommonWidget.yesCancelPopUp(Constants.sureTologout, () async {
      await pref.setString(
        Constants.loginToken,
        "",
      );
      Get.offAllNamed(Routes.login);
    });
  }
}
