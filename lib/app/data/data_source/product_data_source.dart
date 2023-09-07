import 'package:get/get.dart';
import 'package:ppildo/app/common/controller/check_network.dart';
import 'package:ppildo/app/data/models/product_model.dart';
import 'package:ppildo/app/data/service/product_service.dart';
import 'package:ppildo/app/utils/constants.dart';

class ProductDataSource {
  ProductService productService = Get.put(ProductService());

  Future<ProductListModel> getProducts() async {
    try {
      if (await CheckNetwork.checkNetwork() == false) {
        throw "${Constants.checkConnectivity}, ${Constants.tryAgain}";
      } else {
        final response = await productService.getProducts();
        if (response.statusCode == 200) {
          final responseBody = response.data;

          return ProductListModel.fromJson(responseBody);
        } else {
          throw ("${Constants.failedToConnectServer} , ${Constants.tryAgain}");
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
