import 'package:ppildo/app/data/data_source/customer_data_source.dart';
import 'package:ppildo/app/data/models/customer_model.dart';
import 'package:ppildo/app/data/models/sub_customer_model.dart';
import 'package:ppildo/app/data/models/user_modules_list_model.dart';

class CustomerRepository {
  Future<UserModulesListModel> getUserInfo(String userName) async {
    try {
      final response = await CustomerDataSource().getUserInfo(userName);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<CustomerListModel> getCustomer() async {
    try {
      final response = await CustomerDataSource().getCustomer();

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<SubCustomerListModel> getSubCustomer(int customerId) async {
    try {
      final response = await CustomerDataSource().getSubCustomer(customerId);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<double> getCustomerDueBalance(int customerId) async {
    try {
      final response =
          await CustomerDataSource().getCustomerDueBalance(customerId);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
