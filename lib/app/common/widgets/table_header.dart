import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/text_style.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

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
              color: AppColors.blueGrey,
            ),
            children: [
              _buildHeaderItem(Constants.productCode),
              // _buildHeaderItem(Constants.description),
              _buildHeaderItem(Constants.name),
              _buildHeaderItem(Constants.rateAndDiscount),
              _buildHeaderItem(Constants.qtyAndTotalAmount),
            ],
          ),
        ],
      ),
    );
  }

  _buildHeaderItem(String name) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: Text(
            name,
            style: AppTextStyle.bw14,
          ),
        ),
      ),
    );
  }
}
