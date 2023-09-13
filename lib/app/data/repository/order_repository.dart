import 'dart:typed_data';

import 'package:ppildo/app/data/data_source/order_data_source.dart';
import 'package:ppildo/app/data/models/customer_model.dart';
import 'package:ppildo/app/data/models/product_model.dart';
import 'package:ppildo/app/data/models/sales_with_date_model.dart';
import 'package:ppildo/app/data/models/sub_customer_model.dart';

class OrderRepository {
  Future<SalesWithDateListModel> getSalesWithDateList(
    DateTime fromDate,
    DateTime toDate,
  ) async {
    try {
      final response =
          await OrderDataSource().getSalesWithDateList(fromDate, toDate);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<SalesWithDateListModel> getSalesWithDateASMList(
    DateTime fromDate,
    DateTime toDate,
  ) async {
    try {
      final response =
          await OrderDataSource().getSalesWithDateASMList(fromDate, toDate);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> placeOrder(
    CustomerModel customer,
    SubCustomerModel subCustomer,
    List<ProductModel> productList,
    DateTime saledate,
    DateTime deliverydate,
    String deliveryAddress,
    double totalAmount,
    double disAmount,
    String notes,
    String paymentMode,
    double dueAmount,
    String deliveryMobileNo,
  ) async {
    try {
      final response = await OrderDataSource().placeOrder(
          customer,
          subCustomer,
          productList,
          saledate,
          deliverydate,
          deliveryAddress,
          totalAmount,
          disAmount,
          notes,
          paymentMode,
          dueAmount,
          deliveryMobileNo);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> orderApprovedAsm(
    SalesWithDateModel data,
  ) async {
    try {
      // ignore: unused_local_variable
      final response = await OrderDataSource().orderApprovedAsm(data);
      // return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Uint8List> getPdf(
    int id,
  ) async {
    try {
      final response = await OrderDataSource().getPdf(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> newOrderCount() async {
    try {
      final response = await OrderDataSource().newOrderCount();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
