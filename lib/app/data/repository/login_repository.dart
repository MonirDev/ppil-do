import 'package:ppildo/app/data/data_source/login_data_source.dart';
import 'package:ppildo/app/data/models/login_model.dart';

class LoginRepository {
  Future<LoginModel> login(
    String userName,
    String password,
  ) async {
    try {
      final response = await LoginDataSource().login(
        userName,
        password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
