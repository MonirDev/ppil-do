import 'package:get/get.dart';
import 'package:ppildo/app/common/controller/check_network.dart';
import 'package:ppildo/app/data/models/login_model.dart';
import 'package:ppildo/app/data/service/login_service.dart';
import 'package:ppildo/app/utils/constants.dart';

class LoginDataSource {
  LoginService loginService = Get.put(LoginService());

  Future<LoginModel> login(
    String userName,
    String password,
  ) async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await loginService.login(
          userName,
          password,
        );
        if (response.statusCode == 200) {
          final responseBody = response.data;
          return LoginModel.fromJson(responseBody);
        } else if (response.statusCode == 401) {
          throw (Constants.tokenExpired);
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
