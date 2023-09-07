import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/modules/create_order/controllers/create_order_controller.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:ppildo/app/utils/text_style.dart';

class DropDownItemPaymentMode extends StatelessWidget {
  DropDownItemPaymentMode({super.key});
  final CreateOrderController controller = Get.find<CreateOrderController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(Constants.modeOfPayment),
          SpacerWidget.h10,
          DropdownSearch<String>(
            items: Constants.paymentList,
            dropdownDecoratorProps: Constants.dropDownStyle,
            onChanged: (selectedItem) => controller.paymentModeChanged(
              selectedItem!,
            ),
            popupProps: const PopupProps.bottomSheet(
              constraints: Constants.constraints,
              showSearchBox: false,
              bottomSheetProps: Constants.bottomSheetProps,
            ),
          ),
        ],
      ),
    );
  }

  //Build dropdown lable
  _label(String label) {
    return Text(
      label,
      style: AppTextStyle.bw16,
    );
  }
}
