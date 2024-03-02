import 'package:dio/dio.dart';
import 'package:ppildo/app/data/service/dio_base_service.dart';
import 'package:ppildo/app/utils/constants.dart';

class LoginService extends DioBaseService {
  final Dio _dio = DioBaseService.dio;

  Future<Response> login(
    String userName,
    String password,
    int companyId,
  ) async {
    final data = {
      "username": userName,
      "password": password,
      "companyId": companyId,
    };

    try {
      return await _dio.post(Constants.loginEndpoint, data: data);
    } catch (e) {
      throw Constants.networkProblemPleaseTryAgainLater;
    }
  }

  Future<Response> getUserCompany(
    String userName,
  ) async {
    try {
      return await _dio.get(
        "${Constants.getUserCompanyEndpoint}$userName",
      );
    } catch (e) {
      throw Constants.networkProblemPleaseTryAgainLater;
    }
  }
}
