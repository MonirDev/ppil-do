import 'package:ppildo/app/data/data_source/login_data_source.dart';
import 'package:ppildo/app/data/models/company_model.dart';
import 'package:ppildo/app/data/models/login_model.dart';

class LoginRepository {
  Future<LoginModel> login(
    String userName,
    String password,
    int companyId,
  ) async {
    try {
      final response = await LoginDataSource().login(
        userName,
        password,
        companyId,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CompanyModel>> getUserCompany(
    String userName,
  ) async {
    try {
      final response = await LoginDataSource().getUserCompany(
        userName,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
