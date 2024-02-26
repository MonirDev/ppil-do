import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/data/models/product_model.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:ppildo/app/utils/text_style.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({
    super.key,
    required this.product,
    required this.pRate,
    required this.disPercentage,
    required this.netRate,
    required this.qty,
    required this.totalAmount,
  });

  final ProductModel product;
  final double pRate;
  final double disPercentage;
  final double netRate;
  final double qty;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Table(
        border: TableBorder.all(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: Constants.tableColumnWidth,
        children: [
          TableRow(
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            children: [
              _buildItem(product.productCode ?? "P00"),
              _buildDescription(product),
              _buildRateDis(product),
              _buildQtyTotalAmount(product),
            ],
          ),
        ],
      ),
    );
  }

  _buildDescription(ProductModel product) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.productItemName ?? "",
              style: AppTextStyle.bb12,
            ),
            SpacerWidget.h5,
            Text(
              "Color: ${product.color ?? ""}",
              style: AppTextStyle.nb12,
            ),
          ],
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       product.productItemName ?? "",
        //       style: AppTextStyle.bb12,
        //     ),
        //     SpacerWidget.h6,
        //     _buildRowItem(
        //       Constants.category,
        //       product.productCategoryName ?? "Empty",
        //     ),
        //     SpacerWidget.h6,
        //     _buildRowItem(
        //       Constants.model,
        //       product.productModelName ?? "Empty",
        //     ),
        //     SpacerWidget.h6,
        //     _buildRowItem(
        //       Constants.group,
        //       product.productGroupName ?? "Empty",
        //     ),
        //     SpacerWidget.h6,
        //     _buildRowItem(
        //       Constants.brand,
        //       product.productBrandName ?? "Empty",
        //     ),
        //   ],
        // ),
      ),
    );
  }

  _buildRateDis(ProductModel product) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRowItem(
              Constants.rate,
              "$pRate",
            ),
            SpacerWidget.h6,
            _buildRowItem(
              Constants.disPercentage,
              "${disPercentage.toStringAsFixed(0)}%",
            ),
            SpacerWidget.h6,
            _buildRowItem(
              Constants.discount,
              (pRate - netRate).toStringAsFixed(1),
            ),
            SpacerWidget.h6,
            _buildRowItem(
              Constants.netRate,
              netRate.toString(),
            ),
          ],
        ),
      ),
    );
  }

  _buildQtyTotalAmount(ProductModel product) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildRowItem(
              Constants.qty,
              qty.toStringAsFixed(0),
            ),
            SpacerWidget.h6,
            _buildRowItem(
              Constants.discountTotal,
              ((pRate - netRate) * qty).toStringAsFixed(1),
            ),
            SpacerWidget.h6,
            _buildRowItem(
              Constants.totalAmount,
              "$totalAmount",
            ),
          ],
        ),
      ),
    );
  }

  _buildRowItem(
    String label,
    String value,
  ) {
    return RichText(
      text: TextSpan(
        text: "$label : ",
        style: AppTextStyle.bb12,
        children: [
          TextSpan(
            text: value,
            style: AppTextStyle.nb12,
          )
        ],
      ),
    );
  }

  _buildItem(String value) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: Text(
            value,
            style: AppTextStyle.bb12,
          ),
        ),
      ),
    );
  }
}
