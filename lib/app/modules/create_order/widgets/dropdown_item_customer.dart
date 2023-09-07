import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/data/models/customer_model.dart';
import 'package:ppildo/app/modules/create_order/controllers/create_order_controller.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:ppildo/app/utils/text_style.dart';

class DropDownItemCustomer extends StatelessWidget {
  DropDownItemCustomer({super.key});
  final CreateOrderController controller = Get.find<CreateOrderController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(Constants.selectCustomer),
          SpacerWidget.h10,
          Obx(
            () => DropdownSearch<CustomerModel>(
              selectedItem: controller.customerModel.value.name == null
                  ? null
                  : controller.customerModel.value,
              // ignore: invalid_use_of_protected_member
              items: controller.customerList.value,
              itemAsString: (CustomerModel item) => item.name ?? "",
              dropdownDecoratorProps: Constants.dropDownStyle,
              onChanged: (selectedItem) => controller.customerChanged(
                selectedItem!,
              ),
              popupProps: const PopupProps.bottomSheet(
                constraints: Constants.constraints,
                showSearchBox: true,
                bottomSheetProps: Constants.bottomSheetProps,
              ),
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
