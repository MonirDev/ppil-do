import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/data/models/sub_customer_model.dart';
import 'package:ppildo/app/modules/create_order/controllers/create_order_controller.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:ppildo/app/utils/text_style.dart';

class DropDownItemSubCustomer extends StatelessWidget {
  DropDownItemSubCustomer({super.key});
  final CreateOrderController controller = Get.find<CreateOrderController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(Constants.selectSubCustomer),
          SpacerWidget.h10,
          Obx(() => DropdownSearch<SubCustomerModel>(
                selectedItem:
                    controller.subCustomerModel.value.subCustomerName == null
                        ? null
                        : controller.subCustomerModel.value,
                // ignore: invalid_use_of_protected_member
                items: controller.subCustomerList.value,
                itemAsString: (SubCustomerModel item) =>
                    item.subCustomerName ?? "",
                dropdownDecoratorProps: Constants.dropDownStyle,
                onChanged: (selectedItem) => controller.subcustomerChanged(
                  selectedItem!,
                ),
                popupProps: const PopupProps.bottomSheet(
                  constraints: Constants.constraints,
                  showSearchBox: true,
                  bottomSheetProps: Constants.bottomSheetProps,
                ),
              )),
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
