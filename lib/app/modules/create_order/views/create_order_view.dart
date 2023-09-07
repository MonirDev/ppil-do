import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppildo/app/common/widgets/common_widget.dart';
import 'package:ppildo/app/common/widgets/custom_app_bar.dart';
import 'package:ppildo/app/common/widgets/custom_button.dart';
import 'package:ppildo/app/common/widgets/custom_table.dart';
import 'package:ppildo/app/common/widgets/logo_widget.dart';
import 'package:ppildo/app/common/widgets/table_header.dart';
import 'package:ppildo/app/common/widgets/text_form_field_widget.dart';
import 'package:ppildo/app/modules/create_order/widgets/dropdown_item_customer.dart';
import 'package:ppildo/app/modules/create_order/widgets/dropdown_item_payment_mode.dart';
import 'package:ppildo/app/modules/create_order/widgets/dropdown_item_product.dart';
import 'package:ppildo/app/modules/create_order/widgets/dropdown_item_sub_customer.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:ppildo/app/utils/text_style.dart';

import '../controllers/create_order_controller.dart';

class CreateOrderView extends GetView<CreateOrderController> {
  CreateOrderView({Key? key}) : super(key: key);
  @override
  final CreateOrderController controller = Get.put(CreateOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      appBar: CustomAppBar(
        actions: const [
          LogoWidget(),
        ],
        title: Text(
          Constants.createOrder,
          style: AppTextStyle.bb16,
        ),
      ),
      body: _buildBody(),
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
            DropDownItemCustomer(),
            _customerDueBalance(),
            SpacerWidget.h15,
            DropDownItemSubCustomer(),
            SpacerWidget.h15,
            DropDownItemProduct(),
            _productName(),
            _productTotalPrice(),
            Obx(
              () => Visibility(
                visible: controller.dropProductSelected.value,
                child: Row(
                  children: [
                    Expanded(
                      child: _buildTextFormFieldItem(
                        Constants.ratePcs,
                        Constants.enterPrice,
                        controller.rateTextEditingController,
                        null,
                        (value) => controller.ratePerPcsOnChanged(value),
                      ),
                    ),
                    SpacerWidget.w15,
                    Expanded(
                      child: _buildTextFormFieldItem(
                        Constants.quantity,
                        Constants.enterQuantity,
                        controller.quantityTextEditingController,
                        null,
                        (value) => controller.quantityOnChanged(value),
                      ),
                    ),
                    SpacerWidget.w15,
                    Expanded(
                      child: _buildTextFormFieldItem(
                        Constants.discountPerc,
                        Constants.enterDiscount,
                        controller.discountTextEditingController,
                        null,
                        (value) => controller.discountOnChanged(value),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SpacerWidget.h15,
            SizedBox(
              height: 42,
              child: CustomButton(
                borderRadius: 6,
                paddingHorizontal: 25,
                bgColor: AppColors.amber,
                label: Constants.addThisProduct,
                onPressed: () => controller.addSelectedProduct(),
              ),
            ),
            SpacerWidget.h15,
            _selectedproductList(),
            SpacerWidget.h15,
            _buildTextFormFieldItem(
              Constants.orderEntryDate,
              Constants.selectDate,
              controller.selectSaleDateTextEditingController,
              null,
              (value) {},
              10,
              true,
              Icons.calendar_month,
              () => controller.selectSaleDate(),
            ),
            SpacerWidget.h15,
            _buildTextFormFieldItem(
              Constants.deliveryAddress,
              Constants.enterDeliveryAddress,
              controller.deliveryAddressTextEditingController,
              TextInputType.text,
              (value) => controller.deliveryAddressOnChanged(value),
              10,
            ),
            SpacerWidget.h15,
            _buildTextFormFieldItem(
              Constants.deliveryMobileNo,
              Constants.enterDeliveryMobileNo,
              controller.deliveryMNoTextEditingController,
              null,
              (value) => controller.mobileNoOnChanged(value),
              10,
            ),
            SpacerWidget.h15,
            _buildTextFormFieldItem(
              Constants.deliveryDate,
              Constants.selectDate,
              controller.deliveryDateTextEditingController,
              null,
              (value) {},
              10,
              true,
              Icons.calendar_month,
              () => controller.selectDeliveryDate(),
            ),
            SpacerWidget.h15,
            _buildTextFormFieldItem(
              Constants.notes,
              Constants.writeNotes,
              controller.notesTextEditingController,
              TextInputType.text,
              (value) => controller.notesOnChanged(value),
              10,
            ),
            SpacerWidget.h15,
            DropDownItemPaymentMode(),
            SpacerWidget.h15,
            SpacerWidget.h15,
            SizedBox(
              height: 42,
              child: CustomButton(
                borderRadius: 6,
                paddingHorizontal: 50,
                label: Constants.placeOrder,
                onPressed: () => controller.placeOrder(),
              ),
            ),
            SpacerWidget.h30,
          ],
        ),
      ),
    );
  }

  //build product Name
  _productName() {
    return Obx(() => Visibility(
          visible: controller.productModel.value.productItemName != null,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: controller.productModel.value.productItemName != null
                    ? 10
                    : 0),
            alignment: Alignment.topLeft,
            child: Text(
              "${Constants.product} : ${controller.productModel.value.productItemName}",
              style: AppTextStyle.bw16.copyWith(color: AppColors.green),
            ),
          ),
        ));
  }

  //build Due balance
  _customerDueBalance() {
    return Obx(() => Visibility(
          visible: controller.selectedCustomerDueBalance.value > 0.0,
          child: Container(
            padding: EdgeInsets.only(
                top:
                    controller.selectedCustomerDueBalance.value > 0.0 ? 10 : 0),
            alignment: Alignment.topLeft,
            child: Text(
              "${Constants.dueBalance} : ${controller.selectedCustomerDueBalance}",
              style: AppTextStyle.bw16.copyWith(color: AppColors.green),
            ),
          ),
        ));
  }

  //build total price
  _productTotalPrice() {
    return Obx(() => Visibility(
          visible: controller.productModel.value.productItemName != null,
          child: Container(
            padding: EdgeInsets.only(
                bottom: controller.productModel.value.productItemName != null
                    ? 10
                    : 0),
            alignment: Alignment.topLeft,
            child: Text(
              "${Constants.totalPrice} : ${controller.selectedProductAmount.value}",
              style: AppTextStyle.bw16.copyWith(color: AppColors.green),
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
            style: AppTextStyle.bb16,
          ),
          SpacerWidget.h10,
          Container(
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
            child: CustomTextFormField(
              controller: controllerText.value,
              inputType: inputType ?? TextInputType.number,
              inputAction: TextInputAction.next,
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
              contentpaddingLeft: 20,
            ),
          ),
        ],
      ),
    );
  }

  //Selected Product list
  _selectedproductList() {
    return Obx(() => Visibility(
          visible: controller.selectedProductList.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Constants.selectedProducts,
                style: AppTextStyle.bb16,
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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.selectedProductList.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        Visibility(
                          visible: index == 0,
                          child: const TableHeader(),
                        ),
                        Dismissible(
                          key: Key(controller
                              .selectedProductList[index].productCode
                              .toString()),
                          confirmDismiss: (direction) async {
                            return await CommonWidget.yesCancelPopUp(
                                Constants.sureToDelete, () {
                              Get.back(result: true);
                              return true;
                            });
                          },
                          onDismissed: (direction) {
                            controller.removeSelectedProduct(index);
                          },
                          background: Container(
                            color: AppColors.darkRed,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 16.0),
                            child: const Icon(Icons.delete,
                                color: AppColors.white),
                          ),
                          child: CustomTable(
                            product: controller.selectedProductList[index],
                            pRate:
                                controller.selectedProductList[index].saleRate!,
                            disPercentage:
                                controller.selectedProductList[index].disPerc!,
                            netRate:
                                controller.selectedProductList[index].netRate!,
                            qty:
                                controller.selectedProductList[index].quantity!,
                            totalAmount: controller
                                .selectedProductList[index].totalAmoount!,
                          ),
                        ),
                        Visibility(
                          visible: index ==
                              controller.selectedProductList.length - 1,
                          child: _totalAmount(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  _totalAmount() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          border: Border(
        left: Constants.borderSide,
        right: Constants.borderSide,
        bottom: Constants.borderSide,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRowItem(Constants.grossAmount,
                  controller.getSelectedProductTotalAmount().toString()),
              _buildRowItem(Constants.discountTotal,
                  controller.totalDiscount().toString()),
              _buildRowItem(Constants.netTotal,
                  controller.getSelectedProductNetTotal().toString()),
            ],
          ),
        ],
      ),
    );
  }

  _buildRowItem(
    String label,
    String value,
  ) {
    return Wrap(
      spacing: 4.0,
      alignment: WrapAlignment.center,
      children: [
        Text(
          "$label : ",
          style: AppTextStyle.nb14,
        ),
        Text(
          "$value -/Tk",
          style: AppTextStyle.bb14,
        ),
      ],
    );
  }
}
