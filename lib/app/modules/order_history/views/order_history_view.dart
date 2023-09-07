import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppildo/app/common/widgets/custom_app_bar.dart';
import 'package:ppildo/app/common/widgets/custom_button.dart';
import 'package:ppildo/app/common/widgets/full_screen_loader.dart';
import 'package:ppildo/app/common/widgets/logo_widget.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:ppildo/app/utils/text_style.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../controllers/order_history_controller.dart';

class OrderHistoryView extends GetView<OrderHistoryController> {
  OrderHistoryView({Key? key}) : super(key: key);
  @override
  final OrderHistoryController controller = Get.put(OrderHistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: const CustomAppBar(
        actions: [
          LogoWidget(),
        ],
        title: Text(Constants.orderHistory),
      ),
      body: Obx(() =>
          controller.isLoading.value ? const FullSCreenLoader() : _buildBody()),
    );
  }

  //Build Body
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SpacerWidget.h15,
            _fromToDateRow(),
            SpacerWidget.h15,
            CustomButton(
              borderRadius: 6,
              paddingHorizontal: 25,
              bgColor: AppColors.grey.withOpacity(0.5),
              label: Constants.search,
              onPressed: () => controller.onSearch(),
            ),
            SpacerWidget.h15,
            noData(),
            _selectedproductList(),
            SpacerWidget.h15,
          ],
        ),
      ),
    );
  }

  //Build [From] [To] date
  _fromToDateRow() {
    return Row(
      children: [
        Expanded(
          child: _buildTextFormFieldItem(
            Constants.fromDate,
            Constants.selectDate,
            controller.selectFromDateTextEditingController,
            null,
            (value) {},
            10,
            true,
            Icons.calendar_month,
            () => controller.selectFromDate(),
          ),
        ),
        SpacerWidget.w15,
        Expanded(
          child: _buildTextFormFieldItem(
            Constants.toDate,
            Constants.selectDate,
            controller.selectToDateTextEditingController,
            null,
            (value) {},
            10,
            true,
            Icons.calendar_month,
            () => controller.selectToDate(),
          ),
        ),
      ],
    );
  }

  //Selected Product list
  _selectedproductList() {
    return Obx(() => Visibility(
          visible: controller.orderList.length > 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Constants.orderList,
                style: AppTextStyle.bw18,
              ),
              SpacerWidget.h10,
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                height: 400,
                child: SfDataGrid(
                  source: controller.tableDataSource.value,
                  columnWidthMode: ColumnWidthMode.auto,
                  columns: Constants.orderTableColumn,
                ),
              ),
            ],
          ),
        ));
  }

//
  noData() {
    return Obx(() => Visibility(
          visible: controller.orderList.length < 2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Could not find any order within this date",
                style: AppTextStyle.bw12,
              ),
            ),
          ),
        ));
  }

//Build textFormField
  _buildTextFormFieldItem(
    String label,
    String hintText,
    Rx<TextEditingController> controllerText,
    TextInputType? inputType,
    void Function(String)? onChanged, [
    double? horizontalpadding,
    bool? readOnly,
    IconData? suffixIcon,
    void Function()? onTap,
  ]) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyle.bw16,
          ),
          SpacerWidget.h10,
          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: AppColors.white),
            ),
            child: TextFormField(
              controller: controllerText.value,
              style: AppTextStyle.nw16,
              keyboardType: inputType ?? TextInputType.number,
              cursorColor: AppColors.white,
              readOnly: readOnly ?? false,
              onTap: onTap ?? () {},
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyle.nw14.copyWith(
                  color: AppColors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: horizontalpadding ?? 6,
                ),
                suffixIcon: suffixIcon != null
                    ? Icon(
                        suffixIcon,
                        color: AppColors.white,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
