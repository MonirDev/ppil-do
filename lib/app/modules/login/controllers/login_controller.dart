import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppildo/app/common/widgets/common_widget.dart';
import 'package:ppildo/app/data/repository/login_repository.dart';
import 'package:ppildo/app/routes/app_pages.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var userNameTextEditingController = TextEditingController().obs;
  var passwordTextEditingController = TextEditingController().obs;

  var isUserNameEmpty = false.obs;
  var isPassEmpty = false.obs;
  var isPassSecure = true.obs;

  final LoginRepository _loginRepository = Get.put(LoginRepository());

//Call login api
  login() async {
    if (userNameTextEditingController.value.text.isNotEmpty &&
        passwordTextEditingController.value.text.isNotEmpty) {
      CommonWidget.loader();
      try {
        await _loginRepository
            .login(userNameTextEditingController.value.text,
                passwordTextEditingController.value.text)
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
}
