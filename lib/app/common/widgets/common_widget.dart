import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/routes/app_pages.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';

class CommonWidget {
  static Future<DateTime?> showDatePickerDialog(DateTime initial) {
    return showDatePicker(
      context: Get.context!,
      initialDate: initial,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
  }

  static loader() {
    return Get.dialog(
      AlertDialog(
        content: SizedBox(
          height: 50,
          child: Row(
            children: [
              const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: AppColors.accentColor,
                ),
              ),
              SpacerWidget.w10,
              const Text(Constants.pleaseWait),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static Future<dynamic> responseErrorPopUp(String msg, Function retry) async {
    return Get.defaultDialog(
      title: "",
      radius: 12,
      titleStyle: const TextStyle(height: 0),
      titlePadding: EdgeInsets.zero,
      actions: null,
      middleText: "",
      barrierDismissible: false,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            Constants.errorText,
            style: Get.textTheme.titleLarge?.copyWith(color: AppColors.red),
          ),
          SpacerWidget.h15,
          Text(msg),
          SpacerWidget.h20,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    if (msg == Constants.tokenExpired) Get.back();
                  },
                  child: const Text(Constants.cancel),
                ),
              ),
              SpacerWidget.w15,
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    Get.back();
                    retry();
                    if (msg == Constants.tokenExpired) {
                      await SharedPreferences.getInstance().then((pref) async {
                        await pref.setString(
                          Constants.loginToken,
                          "",
                        );
                      });
                      Get.offAllNamed(Routes.login);
                    }
                  },
                  child: Text(msg == Constants.tokenExpired
                      ? Constants.login
                      : Constants.retry),
                ),
              ),
            ],
          )
        ],
      ),
      contentPadding: const EdgeInsets.only(right: 20, left: 20, top: 20),
    );
  }

  static Future<dynamic> yesCancelPopUp(String msg, Function yesFn) async {
    return Get.defaultDialog(
      title: "",
      radius: 12,
      titleStyle: const TextStyle(height: 0),
      titlePadding: EdgeInsets.zero,
      actions: null,
      middleText: "",
      barrierDismissible: false,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(msg),
          SpacerWidget.h20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back(result: false);
                  },
                  child: const Text(Constants.cancel),
                ),
              ),
              SpacerWidget.w15,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    yesFn();
                  },
                  child: const Text(Constants.yes),
                ),
              ),
            ],
          )
        ],
      ),
      contentPadding: const EdgeInsets.only(right: 20, left: 20, top: 20),
    );
  }

  static callSnackBar(String message, [bool? isError]) {
    return Get.snackbar("", "",
        colorText: Colors.black,
        titleText: Container(),
        duration: const Duration(seconds: 3),
        messageText: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  message,
                  style: Get.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      letterSpacing: 0),
                ),
              ),
            ),
          ],
        ),
        borderRadius: 4.0,
        margin: const EdgeInsets.all(10),
        backgroundColor: isError != null ? AppColors.green : AppColors.red,
        snackPosition: SnackPosition.BOTTOM);
  }
}
