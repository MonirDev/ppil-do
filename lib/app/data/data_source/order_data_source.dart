import 'dart:developer';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:ppildo/app/common/controller/check_network.dart';
import 'package:ppildo/app/data/models/customer_model.dart';
import 'package:ppildo/app/data/models/product_model.dart';
import 'package:ppildo/app/data/models/sales_with_date_model.dart';
import 'package:ppildo/app/data/models/sub_customer_model.dart';
import 'package:ppildo/app/data/service/order_service.dart';
import 'package:ppildo/app/modules/home/controllers/home_controller.dart';
import 'package:ppildo/app/utils/constants.dart';

class OrderDataSource {
  OrderService orderService = Get.put(OrderService());

  Future<SalesWithDateListModel> getSalesWithDateList(
    DateTime fromDate,
    DateTime toDate,
  ) async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await orderService.getSalesWithDate(
          fromDate,
          toDate,
          Get.find<HomeController>().isMr.value
              ? Constants.getSalesWithDateMREndpoint
              : Constants.getSalesWithDateASMEndpoint,
        );
        if (response.statusCode == 200) {
          final responseBody = response.data;
          return SalesWithDateListModel.fromJson(responseBody);
        } else if (response.statusCode == 401) {
          throw (Constants.tokenExpired);
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<SalesWithDateListModel> getSalesWithDateASMList(
    DateTime fromDate,
    DateTime toDate,
  ) async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await orderService.getSalesWithDateASM(
          fromDate,
          toDate,
        );
        if (response.statusCode == 200) {
          final responseBody = response.data;
          return SalesWithDateListModel.fromJson(responseBody);
        } else if (response.statusCode == 401) {
          throw (Constants.tokenExpired);
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
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
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await orderService.placeOrder(
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
        if (response.statusCode == 200) {
          final responseBody = response.data;
          log("res dataSource $responseBody");
        } else if (response.statusCode == 401) {
          throw (Constants.tokenExpired);
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> orderApprovedAsm(
    SalesWithDateModel data,
  ) async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await orderService.orderApprovedAsm(data);
        if (response.statusCode == 200) {
          // final responseBody = response.data;
          // return responseBody;
        } else if (response.statusCode == 401) {
          throw (Constants.tokenExpired);
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Uint8List> getPdf(int id) async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await orderService.getPdf(id);
        return response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> newOrderCount() async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await orderService.newOrderCount();
        if (response.statusCode == 200) {
          final responseBody = response.data;
          log("count $responseBody");
          return responseBody;
        } else if (response.statusCode == 401) {
          throw (Constants.tokenExpired);
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
