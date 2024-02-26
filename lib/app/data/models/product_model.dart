class ProductListModel {
  List<ProductModel> productlist;
  ProductListModel({
    required this.productlist,
  });
  factory ProductListModel.fromJson(List<dynamic>? json) => ProductListModel(
        productlist: json == null || json.isEmpty
            ? []
            : json.map((e) => ProductModel.fromJson(e)).toList(),
      );
}

class ProductModel {
  final String? productCode;
  final String? productItemName;
  final String? productGroupName;
  final String? productBrandName;
  final String? productCategoryName;
  final String? productModelName;
  // final int? productGroupId;
  // final int? productBrandId;
  // final int? productCategoryId;
  // final int? productModelId;
  // final String? stockPack;
  // final String? challanUnit;
  String? color;
  final String? thickness;
  final double? purchaseRate;
  final double? saleRateTp;
  final double? saleRateMrp;
  final double? discountOffer;
  // final String? reOrderLevel;
  // final String? remarks;
  // final int? activeStatus;
  final int? id;
  double? saleRate;
  double? netRate;
  double? quantity;
  double? disPerc;
  double? totalAmoount;

  ProductModel({
    this.productCode,
    this.productItemName,
    this.productGroupName,
    this.productBrandName,
    this.productCategoryName,
    this.productModelName,
    // this.productGroupId,
    // this.productBrandId,
    // this.productCategoryId,
    // this.productModelId,
    // this.stockPack,
    // this.challanUnit,
    this.color,
    this.thickness,
    this.purchaseRate,
    this.saleRateTp,
    this.saleRateMrp,
    this.discountOffer,
    // this.reOrderLevel,
    // this.remarks,
    // this.activeStatus,
    this.id,
    this.saleRate,
    this.netRate,
    this.quantity,
    this.disPerc,
    this.totalAmoount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productCode: json["productCode"],
        productItemName: json["productItemName"],
        productGroupName: json["productGroupName"],
        productBrandName: json["productBrandName"],
        productCategoryName: json["productCategoryName"],
        productModelName: json["productModelName"],
        // productGroupId: json["productGroupId"],
        // productBrandId: json["productBrandId"],
        // productCategoryId: json["productCategoryId"],
        // productModelId: json["productModelId"],
        // stockPack:
        //     json["stockPack"] != null ? json["stockPack"].toString() : "",
        // challanUnit:
        //     json["challanUnit"] != null ? json["challanUnit"].toString() : "",
        color: json["color"],
        thickness: json["thickness"],
        purchaseRate: json["purchaseRate"],
        saleRateTp: json["saleRateTp"],
        saleRateMrp: json["saleRateMrp"],
        discountOffer: json["discountOffer"],
        // reOrderLevel: json["reOrderLevel"],
        // remarks: json["remarks"],
        // activeStatus: json["activeStatus"],
        id: json["id"],
        saleRate: 0.0,
        netRate: 0.0,
        quantity: 0.0,
        disPerc: 0.0,
        totalAmoount: 0.0,
      );
}
