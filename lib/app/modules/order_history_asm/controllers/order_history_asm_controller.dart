import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ppildo/app/common/widgets/common_widget.dart';
import 'package:ppildo/app/data/models/sales_with_date_asm_model.dart';
import 'package:ppildo/app/data/repository/order_repository.dart';
import 'package:ppildo/app/modules/home/controllers/home_controller.dart';
import 'package:ppildo/app/modules/order_history_asm/helper/order_table_data_source.dart';
import 'package:ppildo/app/utils/constants.dart';

class OrderHistoryAsmController extends GetxController {
  var selectFromDateTextEditingController = TextEditingController().obs;
  var selectToDateTextEditingController = TextEditingController().obs;
//value
  Rx<DateTime> selectedFromDate = DateTime.now().obs;
  Rx<DateTime> selectedToDate = DateTime.now().obs;

  Rx<OrderTableDataSourceAsm> tableDataSource = OrderTableDataSourceAsm(
    orderData: [],
    isMr: true,
  ).obs;

  var orderList = <OrderAsmModel>[].obs;
  var isLoading = true.obs;

//put repository
  final OrderRepository _orderRepository = Get.put(OrderRepository());

  @override
  void onInit() async {
    super.onInit();
    await getSalesWithDateASMList();

    selectFromDateTextEditingController.value.text =
        DateFormat(Constants.dateFormat).format(selectedFromDate.value);
    selectToDateTextEditingController.value.text =
        DateFormat(Constants.dateFormat).format(selectedToDate.value);
  }

  orderApprovedASM(int index) {
    CommonWidget.yesCancelPopUp(Constants.areUSureToApprovedDo, () async {
      Get.back();
      CommonWidget.loader();
      try {
        await _orderRepository.orderApprovedAsm(orderList[index]).then(
          (value) async {
            Get.back();

            await getSalesWithDateASMList();
          },
        );
      } catch (e) {
        Get.back();
        CommonWidget.responseErrorPopUp(e.toString(), () {
          if (e.toString() != Constants.tokenExpired) getSalesWithDateASMList();
        });
        log("orderApprovedASM Api error");
      }
      // orderList[0].toJson();
    });
  }

  //on Search
  onSearch() async {
    await getSalesWithDateASMList();
  }

  //Get Order list
  getSalesWithDateASMList() async {
    isLoading(true);
    try {
      await _orderRepository
          .getSalesWithDateASMList(
        selectedFromDate.value,
        selectedToDate.value,
      )
          .then(
        (value) async {
          orderList.value = value.salesWithDateList;
          orderList.add(OrderAsmModel(billAmount: 0.0));
          tableDataSource.value = OrderTableDataSourceAsm(
            orderData: orderList,
            isMr: Get.find<HomeController>().isMr.value,
          );

          isLoading(false);
        },
      );
    } catch (e) {
      isLoading(false);
      CommonWidget.responseErrorPopUp(e.toString(), () {
        if (e.toString() != Constants.tokenExpired) getSalesWithDateASMList();
      });
      log("GetSalesWithDateASM Api error");
    }
  }

  //select From date date
  Future<void> selectFromDate() async {
    final DateTime? pickedDate = await CommonWidget.showDatePickerDialog(
      selectedFromDate.value,
    );

    if (pickedDate != null) {
      selectedFromDate.value = pickedDate;
      selectFromDateTextEditingController.value.text =
          DateFormat(Constants.dateFormat).format(
        selectedFromDate.value,
      );
    }
  }

  //select ToDate
  Future<void> selectToDate() async {
    final DateTime? pickedDate = await CommonWidget.showDatePickerDialog(
      selectedToDate.value,
    );

    if (pickedDate != null) {
      selectedToDate.value = pickedDate;
      selectToDateTextEditingController.value.text =
          DateFormat(Constants.dateFormat).format(selectedToDate.value);
    }
  }
}
