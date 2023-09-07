import 'package:dio/dio.dart';
import 'package:ppildo/app/data/service/dio_base_service.dart';
import 'package:ppildo/app/utils/constants.dart';

class LoginService extends DioBaseService {
  final Dio _dio = DioBaseService.dio;

  Future<Response> login(
    String userName,
    String password,
  ) async {
    final data = {
      "username": userName,
      "password": password,
    };

    try {
      return await _dio.post(Constants.loginEndpoint, data: data);
    } catch (e) {
      throw Constants.networkProblemPleaseTryAgainLater;
    }
  }
}
