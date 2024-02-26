import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ppildo/app/data/models/customer_model.dart';
import 'package:ppildo/app/data/models/product_model.dart';
import 'package:ppildo/app/data/models/sales_with_date_asm_model.dart';
import 'package:ppildo/app/data/models/sub_customer_model.dart';
import 'package:ppildo/app/data/service/dio_base_service.dart';
import 'package:ppildo/app/utils/constants.dart';
import 'package:http/http.dart' as http;

class OrderService extends DioBaseService {
  final Dio _dio = DioBaseService.dio;

  Future<Response> placeOrder(
    CustomerModel customer,
    SubCustomerModel subCustomer,
    List<ProductModel> productList,
    DateTime saledate,
    DateTime deliverydate,
    String deliveryAddress,
    double totalAmount, //total amount after discount
    double disAmount, //total discount amount
    String notes,
    String paymentMode,
    double dueAmount,
    String deliveryMobileNo,
  ) async {
    final data = {
      "customerId": customer.id,
      "customerName": customer.name,
      "phone": customer.phone,
      "address": customer.address,
      "orderNumber": "",
      "saleOrderDate": saledate.toIso8601String(),
      "deliveryDate": deliverydate.toIso8601String(),
      "billAmount": totalAmount,
      "paidAmount": 0,
      "dueAmount": totalAmount,
      "remarks": "Sales Order from Apps",
      "notes": notes,
      "saleType": "Order",
      "paymentMode": paymentMode,
      "deliveryAddress": deliveryAddress,
      "deliveryContact": deliveryMobileNo,
      "personnelId": customer.personnelId,
      "personnelName": customer.personnelName,
      "subCustomerName": subCustomer.name,
      "subCustomerId": subCustomer.id,
      "saleOrderMappings": productList
          .map((e) => {
                "productItemId": e.id,
                "productItemName": e.productItemName,
                "saleQty": e.quantity,
                "saleRate": e.saleRate,
                "productCode": e.productCode,
                "total": e.saleRate! * e.quantity!,
                "commPercent": e.disPerc,
                "colorType": e.color,
                "commAmount": (e.saleRate! - e.netRate!) * e.quantity!,
                "netAmount": e.totalAmoount
              })
          .toList(),
      "totalDue": dueAmount
    };

    try {
      final res = await _dio.post(
        Constants.postSaleEndpoint,
        data: data,
      );

      return res;
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

  //
  Future<Response> getSalesWithDate(
    DateTime fromDate,
    DateTime toDate,
    String endpoint,
  ) async {
    final data = {
      "fromDate": fromDate.toIso8601String(),
      "toDate": toDate.toIso8601String(),
    };
    try {
      return await _dio.post(
        endpoint,
        data: data,
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

  //
  Future<Response> getSalesWithDateASM(
    DateTime fromDate,
    DateTime toDate,
  ) async {
    final data = {
      "fromDate": fromDate.toIso8601String(),
      "toDate": toDate.toIso8601String(),
    };
    try {
      return await _dio.post(
        Constants.getSalesWithDateASMEndpoint,
        data: data,
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

  Future<Uint8List> getPdf(int id) async {
    try {
      final res = await http.get(
          Uri.parse(
              "${dotenv.env[Constants.baseURL]}${Constants.getPdfEndpoint}$id"),
          headers: {"Content-type": "Application/Pdf"});

      return Uint8List.fromList(res.bodyBytes);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          throw (Constants.tokenExpired);
        }
      }
      throw Constants.networkProblemPleaseTryAgainLater;
    }
  }

  Future<Response> orderApprovedAsm(
    OrderAsmModel data,
  ) async {
    try {
      return await _dio.post(
        Constants.orderApprovedAsm,
        data: data.toJson(),
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

//
  Future<Response> newOrderCount() async {
    try {
      return await _dio.get(
        Constants.orderCountAsmNew,
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
