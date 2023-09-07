import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/common/widgets/common_widget.dart';
import 'package:ppildo/app/data/repository/order_repository.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfViewController extends GetxController {
  Future<Uint8List>? pdfData;
  var id = 0;
  var argument = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    id = argument as int;
    pdfData = viewPdf(id);
  }

  Future<Uint8List> viewPdf(int id) async {
    try {
      return await Get.put(OrderRepository()).getPdf(id);
    } catch (e) {
      CommonWidget.callSnackBar(e.toString());
      return Uint8List(100);
    }
  }

  downloadPdf() async {
    var url = Uri.parse(
        "${dotenv.env[Constants.baseURL]}${Constants.getPdfEndpoint}$id");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      CommonWidget.callSnackBar(Constants.somethingWentWrong);
      throw 'Could not launch $url';
    }
  }
}
