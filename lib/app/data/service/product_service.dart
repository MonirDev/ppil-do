import 'package:dio/dio.dart';
import 'package:ppildo/app/data/service/dio_base_service.dart';
import 'package:ppildo/app/utils/constants.dart';

class ProductService extends DioBaseService {
  final Dio _dio = DioBaseService.dio;

  Future<Response> getProducts() async {
    try {
      return await _dio.get(
        Constants.getProductEndpoint,
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
}
