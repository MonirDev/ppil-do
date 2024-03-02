import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ppildo/app/common/widgets/custom_button.dart';
import 'package:ppildo/app/common/widgets/text_form_field_widget.dart';
import 'package:ppildo/app/data/models/company_model.dart';
import 'package:ppildo/app/modules/login/controllers/login_controller.dart';
import 'package:ppildo/app/modules/login/widgets/company_dropdown.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/assets.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:ppildo/app/utils/spacer_widgets.dart';
import 'package:ppildo/app/utils/text_style.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //For Unfocus TextField when user click outside
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(child: _buildBody()),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpacerWidget.h10,
            _logo(),
            SpacerWidget.h20,
            _buildHeaderText(),
            SpacerWidget.h30,
            _buildLoginForm(),
            SpacerWidget.h30,
            _buildLoginButton(),
            SpacerWidget.h15,
          ],
        ),
      ),
    );
  }

  //app logo
  _logo() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Image.asset(
        Assets.images.appLogo,
        height: 110,
        width: 110,
        fit: BoxFit.fill,
      ),
    );
  }

//Build Login Button
  Widget _buildLoginButton() {
    return SizedBox(
      width: Get.width,
      child: CustomButton(
        label: Constants.login.toUpperCase(),
        onPressed: () => controller.login(),
      ),
    );
  }

//Build Login Form
  Widget _buildLoginForm() {
    return Obx(() => Column(
          children: [
            _buildUserNameTextFormField(),
            controller.isUserNameEmpty.value == true
                ? _buildValidateText(Constants.userNameRequired)
                : const SizedBox(),
            SpacerWidget.h10,
            _buildPasswordTextFormField(),
            controller.isPassEmpty.value == true
                ? _buildValidateText(Constants.passRequired)
                : const SizedBox(),
            SpacerWidget.h20,
            DropDownItemCompany(),
          ],
        ));
  }

  //Build validate Text
  Widget _buildValidateText(String value) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 15),
        child: Text(
          value,
          style: AppTextStyle.nw12.copyWith(color: AppColors.red),
        ),
      ),
    );
  }

  //Build Password TextFormField
  Widget _buildPasswordTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            Constants.password,
            style: AppTextStyle.bb16,
          ),
        ),
        SpacerWidget.h10,
        CustomTextFormField(
          controller: controller.passwordTextEditingController.value,
          inputType: TextInputType.visiblePassword,
          inputAction: TextInputAction.go,
          suffixEye: controller.isPassSecure.value
              ? Icons.visibility_off
              : Icons.visibility,
          isPassField: true,
          isPassSecure: controller.isPassSecure.value,
          onchanged: (value) {
            controller.passwordTextEditingController.value.text == ''
                ? controller.isPassEmpty.value = true
                : controller.isPassEmpty.value = false;
          },
          suffixClick: () {
            controller.isPassSecure.value = !controller.isPassSecure.value;
          },
          hintText: Constants.enterPassword,
          borderRadius: 30,
        ),
      ],
    );
  }

//Build Email TextFormField
  Widget _buildUserNameTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            Constants.userName,
            style: AppTextStyle.bb16,
          ),
        ),
        SpacerWidget.h10,
        CustomTextFormField(
          controller: controller.userNameTextEditingController.value,
          inputType: TextInputType.emailAddress,
          inputAction: TextInputAction.next,
          suffixDone: Icons.done,
          suffixClose: Icons.close,
          isPassField: false,
          focusNode: controller.userFocusNode.value,
          onchanged: (value) {
            controller.userNameTextEditingController.value.text == ''
                ? controller.isUserNameEmpty.value = true
                : controller.isUserNameEmpty.value = false;
            controller.companyList.clear();
            controller.companyModel.value = CompanyModel();
            // controller.isGetCompanyAPICalled.value = false;
            // print(controller.isGetCompanyAPICalled.value);
          },
          hintText: Constants.enterUserName,
          borderRadius: 30,
        ),
      ],
    );
  }

//Build Header Text
  Widget _buildHeaderText() {
    return Text(
      Constants.login,
      style: AppTextStyle.bw22,
    );
  }
}
