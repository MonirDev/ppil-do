import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppildo/app/common/widgets/custom_app_bar.dart';
import 'package:ppildo/app/common/widgets/custom_button.dart';
import 'package:ppildo/app/common/widgets/full_screen_loader.dart';
import 'package:ppildo/app/common/widgets/logo_widget.dart';
import 'package:ppildo/app/common/widgets/text_form_field_widget.dart';
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
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(
        actions: const [
          LogoWidget(),
        ],
        title: Text(
          Constants.orderHistory,
          style: AppTextStyle.bb16,
        ),
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
              bgColor: AppColors.blue,
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
                style: AppTextStyle.bb18,
              ),
              SpacerWidget.h10,
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFB4B4B4),
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      spreadRadius: 0,
                    ),
                  ],
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
                style: AppTextStyle.bb12,
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
            decoration: const BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFB4B4B4),
                    offset: Offset(0, 2),
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: CustomTextFormField(
              controller: controllerText.value,
              inputType: inputType ?? TextInputType.number,
              inputAction: TextInputAction.next,
              isSuffixWidget: true,
              suffixIcon: suffixIcon != null
                  ? Icon(
                      suffixIcon,
                      color: AppColors.black,
                    )
                  : null,
              isPassField: false,
              readOnly: readOnly ?? false,
              ontap: onTap ?? () {},
              onchanged: onChanged,
              hintText: hintText,
              contentpaddingLeft: 15,
            ),
          ),
        ],
      ),
    );
  }
}
