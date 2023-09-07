import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/common/widgets/custom_app_bar.dart';
import 'package:ppildo/app/common/widgets/full_screen_loader.dart';
import 'package:ppildo/app/common/widgets/logo_widget.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/assets.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:ppildo/app/utils/text_style.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  @override
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      appBar: _appBar(),
      body: Obx(
        () => controller.isLoading.value
            ? const FullSCreenLoader()
            : Center(
                child: _buildBody(),
              ),
      ),
    );
  }

  //Build Body
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: controller.isMr.value,
                  child: _item(
                    Constants.createOrder,
                    () => controller.goToCreateOrderpage(),
                  ),
                ),
                SpacerWidget.h20,
                _item(
                  Constants.orderHistory,
                  () => controller.goToOrderHistorypage(),
                ),
              ],
            )),
      ),
    );
  }

  //Build body Item
  _item(
    String label,
    void Function()? onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 3,
        shadowColor: AppColors.white,
        color: AppColors.bg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                Assets.images.bg,
              ),
            ),
          ),
          width: Get.width,
          height: 130,
          child: Center(
            child: Text(
              label,
              style: AppTextStyle.bw18,
            ),
          ),
        ),
      ),
    );
  }

  //appBar
  _appBar() {
    return CustomAppBar(
      leading: const LogoWidget(),
      title: Obx(() => Text(controller.userName.value)),
      actions: [
        GestureDetector(
          onTap: () => controller.logout(),
          child: Row(
            children: [
              Text(
                Constants.logout,
                style: AppTextStyle.nw16,
              ),
              SpacerWidget.w6,
              const Icon(
                Icons.logout,
                color: AppColors.red,
                size: 20,
              ),
              SpacerWidget.w6,
            ],
          ),
        ),
      ],
    );
  }
}
