import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/data/models/company_model.dart';
import 'package:ppildo/app/modules/login/controllers/login_controller.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/text_style.dart';

class DropDownItemCompany extends StatelessWidget {
  DropDownItemCompany({super.key});
  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Container(
              height: 55,
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
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                child: DropdownSearch<CompanyModel>(
                  selectedItem:
                      controller.companyModel.value.companyName == null
                          ? null
                          : controller.companyModel.value,
                  // ignore: invalid_use_of_protected_member
                  items: controller.companyList.value,
                  itemAsString: (CompanyModel item) => item.companyName ?? "",
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: AppTextStyle.bb14,
                    dropdownSearchDecoration: InputDecoration(
                        hintText: "==Select Company==",
                        hintStyle: AppTextStyle.nw14.copyWith(
                          color: AppColors.grey,
                        ),
                        suffixIconColor: AppColors.black,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.transparent,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.transparent,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 2, left: 15)),
                  ),
                  onChanged: (selectedItem) => controller.companyChanged(
                    selectedItem!,
                  ),
                  popupProps: const PopupProps.bottomSheet(
                    constraints: Constants.constraints,
                    showSearchBox: false,
                    bottomSheetProps: Constants.bottomSheetProps,
                  ),
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
