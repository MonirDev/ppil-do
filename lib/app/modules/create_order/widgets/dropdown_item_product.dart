import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/data/models/product_model.dart';
import 'package:ppildo/app/modules/create_order/controllers/create_order_controller.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:ppildo/app/utils/text_style.dart';

class DropDownItemProduct extends StatelessWidget {
  DropDownItemProduct({super.key});
  final CreateOrderController controller = Get.find<CreateOrderController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(Constants.selectProduct),
          SpacerWidget.h10,
          Obx(
            () => Container(
              height: 48,
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
              child: DropdownSearch<ProductModel>(
                selectedItem:
                    controller.productModel.value.productItemName == null
                        ? null
                        : controller.productModel.value,
                // ignore: invalid_use_of_protected_member
                items: controller.productList.value,
                itemAsString: (ProductModel item) => item.productCode ?? "",
                dropdownDecoratorProps: Constants.dropDownStyle,
                onChanged: (selectedItem) => controller.productChanged(
                  selectedItem!,
                ),
                popupProps: const PopupProps.bottomSheet(
                  constraints: Constants.constraints,
                  showSearchBox: true,
                  bottomSheetProps: Constants.bottomSheetProps,
                ),
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
      style: AppTextStyle.bb16,
    );
  }
}
