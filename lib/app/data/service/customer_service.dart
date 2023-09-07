import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ppildo/app/data/service/dio_base_service.dart';
import 'package:ppildo/app/utils/constants.dart';

class CustomerService extends DioBaseService {
  final Dio _dio = DioBaseService.dio;

  Future<Response> getCustomer() async {
    try {
      return await _dio.get(
        Constants.getCustomerEndpoint,
      );
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          throw (Constants.tokenExpired);
        }
      }
      throw Constants.networkProblemPleaseTryAgainLater;
    }
  }

  Future<Response> getCustomerDueBalance(int customerId) async {
    try {
      return await _dio.get(
        "${Constants.getCustomerDueBalanceEndpoint}?customerId=$customerId",
      );
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          throw (Constants.tokenExpired);
        }
      }
      throw Constants.networkProblemPleaseTryAgainLater;
    }
  }

  Future<Response> getSubCustomer(int customerId) async {
    try {
      return await _dio.get(
        "${Constants.getSubCustomerEndpoint}?customerId=$customerId",
      );
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          throw (Constants.tokenExpired);
        }
      }
      throw Constants.networkProblemPleaseTryAgainLater;
    }
  }

  Future<Response> getUserInfo(String userName) async {
    log(userName);
    try {
      return await _dio.get(
        "${Constants.getUserModulesEndpoint}$userName",
      );
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          throw (Constants.tokenExpired);
        }
      }
      throw Constants.networkProblemPleaseTryAgainLater;
    }
  }
}
