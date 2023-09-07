import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:get/get.dart';
import 'package:ppildo/app/common/widgets/custom_app_bar.dart';
import 'package:ppildo/app/common/widgets/custom_button.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/constants.dart';

import '../controllers/pdf_view_controller.dart';

class PdfViewView extends GetView<PdfViewController> {
  const PdfViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: CustomAppBar(
        title: const Text(Constants.orderPdf),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: CustomButton(
              borderRadius: 6,
              paddingHorizontal: 10,
              bgColor: AppColors.grey.withOpacity(0.5),
              label: Constants.downloadPdf,
              onPressed: () => controller.downloadPdf(),
            ),
          )
        ],
      ),
      body: FutureBuilder<Uint8List>(
        future: controller.pdfData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.white,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return PDFView(
              onViewCreated: (PDFViewController controller) {
                // You can use the controller to perform actions on the PDF
              },
              onRender: (int? pages) {
                // Called when the PDF has been rendered
              },
              onPageChanged: (int? page, int? total) {
                // Called when the current page changes
              },
              filePath: null, // You can provide a local file path if needed
              pdfData:
                  snapshot.data, // Pass the Uint8List containing the PDF data
            );
          }
        },
      ),
    );
  }
}
