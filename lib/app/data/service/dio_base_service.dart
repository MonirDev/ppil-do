import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioBaseService {
  static late Dio _dio;
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _dio = Dio(BaseOptions(
      baseUrl: dotenv.env[Constants.baseURL] ?? "",
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ));

    _prefs = await SharedPreferences.getInstance();

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = _prefs?.getString(Constants.loginToken);

        if (token != null) {
          options.headers[Constants.authorization] = "Bearer $token";
        }
        return handler.next(options);
      },
    ));
  }

  static Dio get dio {
    return _dio;
  }
}
