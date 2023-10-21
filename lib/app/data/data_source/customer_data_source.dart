import 'dart:developer';

import 'package:get/get.dart';
import 'package:ppildo/app/common/controller/check_network.dart';
import 'package:ppildo/app/data/models/customer_model.dart';
import 'package:ppildo/app/data/models/sub_customer_model.dart';
import 'package:ppildo/app/data/models/user_modules_list_model.dart';
import 'package:ppildo/app/data/service/customer_service.dart';
import 'package:ppildo/app/utils/constants.dart';

class CustomerDataSource {
  CustomerService customerService = Get.put(CustomerService());

  Future<UserModulesListModel> getUserInfo(String userName) async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await customerService.getUserInfo(userName);
        if (response.statusCode == 200) {
          final responseBody = response.data;

          return UserModulesListModel.fromJson(responseBody);
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<CustomerListModel> getCustomer() async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await customerService.getCustomer();
        if (response.statusCode == 200) {
          final responseBody = response.data;

          return CustomerListModel.fromJson(responseBody);
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<SubCustomerListModel> getSubCustomer(int customerId) async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await customerService.getSubCustomer(customerId);
        if (response.statusCode == 200) {
          final responseBody = response.data;
          log(responseBody.toString());

          return SubCustomerListModel.fromJson(responseBody);
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<double> getCustomerDueBalance(int customerId) async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response =
            await customerService.getCustomerDueBalance(customerId);
        if (response.statusCode == 200) {
          final responseBody = response.data;

          return responseBody;
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
