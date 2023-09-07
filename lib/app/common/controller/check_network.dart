import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/constants.dart';

class CheckNetwork {
  static Future<bool> checkNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  containerForNoInternet(Function callBackFn) => Container(
        width: Get.width,
        height: Get.height,
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.wifi_off,
              size: 75,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 15.0),
              child: Text(
                Constants.errorText,
                style: Get.theme.textTheme.displayLarge!
                    .copyWith(color: AppColors.green, fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 5, right: 5),
              child: Text(
                Constants.somethingWentWrong.tr,
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.displayMedium!
                    .copyWith(color: AppColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                  border: Border.all(color: AppColors.accentColor, width: 1.5),
                ),
                child: TextButton(
                  onPressed: () {
                    callBackFn();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Text(
                      Constants.tryAgain,
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.displayMedium!.copyWith(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
