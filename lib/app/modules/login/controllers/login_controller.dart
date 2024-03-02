import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/common/widgets/common_widget.dart';
import 'package:ppildo/app/data/models/company_model.dart';
import 'package:ppildo/app/data/repository/login_repository.dart';
import 'package:ppildo/app/routes/app_pages.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var userNameTextEditingController = TextEditingController().obs;
  var passwordTextEditingController = TextEditingController().obs;
  var userFocusNode = FocusNode().obs;

  var isUserNameEmpty = false.obs;
  var isPassEmpty = false.obs;
  var isPassSecure = true.obs;

  var isGetCompanyAPICalled = false.obs;

  var companyModel = CompanyModel().obs;
  var companyList = <CompanyModel>[].obs;
  @override
  void onInit() {
    userFocusNode.value.addListener(_onFocusChange);
    super.onInit();
  }

  final LoginRepository _loginRepository = Get.put(LoginRepository());

//Call login api
  login() async {
    if (userNameTextEditingController.value.text.isNotEmpty &&
        passwordTextEditingController.value.text.isNotEmpty) {
      CommonWidget.loader();
      try {
        await _loginRepository
            .login(
          userNameTextEditingController.value.text,
          passwordTextEditingController.value.text,
          companyModel.value.companyId ?? 0,
        )
            .then(
          (value) async {
            await SharedPreferences.getInstance().then((pref) async {
              await pref.setString(
                Constants.loginToken,
                value.token.toString(),
              );
              await pref.setString(
                Constants.userName,
                value.userName.toString(),
              );
            });

            Get.back();
            Get.offNamed(Routes.home);
          },
        );
      } catch (e) {
        Get.back();
        CommonWidget.responseErrorPopUp(e.toString(), () {
          Get.back();
        });
      }
    } else {
      isUserNameEmpty.value = true;
      isPassEmpty.value = true;
    }
  }

  getUserCompanyList() async {
    if (userNameTextEditingController.value.text.isNotEmpty) {
      // CommonWidget.loader();
      try {
        final res = await _loginRepository.getUserCompany(
          userNameTextEditingController.value.text,
        );
        companyList.value = res;
        if (companyList.isNotEmpty) {
          companyModel.value = companyList[0];
        }
        // Get.back();
      } catch (e) {
        // Get.back();
        CommonWidget.responseErrorPopUp(e.toString(), () {
          Get.back();
        });
      }
    } else {
      CommonWidget.callSnackBar("Enter a user name first", true);
    }
  }

  void _onFocusChange() {
    if (!userFocusNode.value.hasFocus) {
      // When the TextField loses focus, call the API
      getUserCompanyList();
    }
  }

  //select company func
  companyChanged(CompanyModel model) {
    companyModel.value = model;
  }
}
