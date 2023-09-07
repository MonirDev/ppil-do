import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ppildo/app/common/widgets/custom_button.dart';
import 'package:ppildo/app/data/models/sales_with_date_model.dart';
import 'package:ppildo/app/modules/order_history/controllers/order_history_controller.dart';
import 'package:ppildo/app/routes/app_pages.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OrderTableDataSource extends DataGridSource {
  OrderTableDataSource({
    required List<SalesWithDateModel> orderData,
    required bool isMr,
  }) {
    _orderData = List.generate(
      orderData.length,
      (index) => DataGridRow(
        cells: [
          DataGridCell<String>(
              columnName: Constants.sl,
              value: index < orderData.length - 1 ? "${index + 1}" : ""),
          DataGridCell<String>(
            columnName: Constants.date,
            value: orderData[index].saleOrderDate == null
                ? ""
                : DateFormat(Constants.dateFormat)
                    .format(orderData[index].saleOrderDate!),
          ),
          DataGridCell<String>(
              columnName: Constants.partyId,
              value: "${orderData[index].customerId ?? ""}"),
          DataGridCell<String>(
              columnName: Constants.party,
              value: orderData[index].customer?.name ?? ""),
          DataGridCell<String>(
              columnName: Constants.subId,
              value: "${orderData[index].subCustomerId ?? ""}"),
          DataGridCell<String>(
              columnName: Constants.subDealer,
              value: orderData[index].subCustomer?.subCustomerName ?? ""),
          DataGridCell<String>(
              columnName: Constants.orderNo,
              value: orderData[index].orderNumber ?? ""),
          DataGridCell<String>(
              columnName: Constants.saleType,
              value: index < orderData.length - 1
                  ? orderData[index].saleType ?? ""
                  : "Total:"),
          DataGridCell<String>(
            columnName: Constants.bill,
            value: index < orderData.length - 1
                ? "${orderData[index].billAmount ?? ""}"
                : orderData
                    .fold(
                        0.0,
                        (previousValue, element) =>
                            previousValue + element.billAmount!)
                    .toString(),
          ),
          DataGridCell<Widget>(
            columnName: Constants.reviewPreview,
            value: index < orderData.length - 1
                ? SizedBox(
                    height: 30,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          borderRadius: 3,
                          paddingHorizontal: 4,
                          bgColor: AppColors.green.withOpacity(0.8),
                          label: Constants.preview,
                          textSize: 10,
                          onPressed: () async {
                            Get.toNamed(Routes.pdf_view,
                                arguments: orderData[index].id);
                          },
                        ),
                        SpacerWidget.w8,
                        !isMr
                            ? CustomButton(
                                borderRadius: 3,
                                paddingHorizontal: 4,
                                bgColor: orderData[index].isApprovedAsm == true
                                    ? AppColors.grey.withOpacity(0.5)
                                    : AppColors.green.withOpacity(0.8),
                                label: Constants.approved,
                                textSize: 10,
                                onPressed: () {
                                  if (orderData[index].isApprovedAsm != true) {
                                    Get.put(OrderHistoryController())
                                        .orderApprovedASM(index);
                                  }
                                },
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
          DataGridCell<bool>(
              columnName: " ", value: orderData[index].isApprovedAsm),
        ],
      ),
    );
  }

  List<DataGridRow> _orderData = [];

  @override
  List<DataGridRow> get rows => _orderData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: row.getCells()[10].value == true
            ? AppColors.grey.withOpacity(0.5)
            : AppColors.green.withOpacity(0.15),
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2.0),
            child: (e.value is Widget)
                ? e.value
                : Text(
                    e.value == true || e.value == false || e.value == null
                        ? ""
                        : e.value.toString(),
                  ),
          );
        }).toList());
  }
}
