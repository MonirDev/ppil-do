import 'dart:async';
import 'package:get/get.dart';
import 'package:ppildo/app/routes/app_pages.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  var opacity = 0.0.obs;
  var size = 0.obs;
  static late SharedPreferences _prefs;

  @override
  void onInit() async {
    super.onInit();
    logoAnimation();

    _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString(Constants.loginToken) ?? "";
    Future.delayed(const Duration(seconds: 2), () {
      if (token.isNotEmpty) {
        Get.offNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }

//Build animationFn
  Future<void> logoAnimation() async {
    Future.delayed(const Duration(milliseconds: 10), () {
      opacity.value = 1.0;
      // size.value = 100.0;
    });
  }
}
