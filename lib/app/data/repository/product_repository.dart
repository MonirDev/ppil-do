import 'package:ppildo/app/data/data_source/product_data_source.dart';
import 'package:ppildo/app/data/models/product_model.dart';

class ProductRepository {
  Future<ProductListModel> getProducts() async {
    try {
      final response = await ProductDataSource().getProducts();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
