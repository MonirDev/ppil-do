import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/assets.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      body: _buildBody(),
    );
  }

//Build Body with TweenAnimationBuilder
  Widget _buildBody() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1500),
            builder: (BuildContext context, double val, Widget? child) {
              return Opacity(
                opacity: val,
                child: Container(
                  margin: EdgeInsets.only(top: val * 260),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      Assets.images.appLogo,
                      height: val * 120,
                      width: val * 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
            child: const Text('')),
        Obx(() => Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 350),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1500),
                opacity: controller.opacity.value,
                child: const SpinKitThreeInOut(
                  color: AppColors.grey,
                  size: 30,
                ),
              ),
            )),
      ],
    );
  }
}
