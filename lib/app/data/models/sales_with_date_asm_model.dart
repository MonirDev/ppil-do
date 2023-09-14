class SalesWithDateASMListModel {
  List<OrderAsmModel> salesWithDateList;
  SalesWithDateASMListModel({
    required this.salesWithDateList,
  });
  factory SalesWithDateASMListModel.fromJson(List<dynamic>? json) =>
      SalesWithDateASMListModel(
        salesWithDateList: json == null || json.isEmpty
            ? []
            : json.map((e) => OrderAsmModel.fromJson(e)).toList(),
      );
}

class OrderAsmModel {
  final int? id;
  final bool? isApprovedAsm;
  final DateTime? saleOrderDate;
  final int? customerId;
  final String? customerName;
  final int? subCustomerId;
  final String? subCustomerName;
  final String? orderNumber;
  final double? billAmount;
  final String? salesPerson;
  final String? asm;

  OrderAsmModel({
    this.id,
    this.isApprovedAsm,
    this.saleOrderDate,
    this.customerId,
    this.customerName,
    this.subCustomerId,
    this.subCustomerName,
    this.orderNumber,
    this.billAmount,
    this.salesPerson,
    this.asm,
  });

  factory OrderAsmModel.fromJson(Map<String, dynamic> json) => OrderAsmModel(
        id: json["id"],
        isApprovedAsm: json["isApprovedAsm"],
        saleOrderDate: json["saleOrderDate"] == null
            ? null
            : DateTime.parse(json["saleOrderDate"]),
        customerId: json["customerId"],
        customerName: json["customerName"],
        subCustomerId: json["subCustomerId"],
        subCustomerName: json["subCustomerName"],
        orderNumber: json["orderNumber"],
        billAmount: json["billAmount"]?.toDouble(),
        salesPerson: json["salesPerson"],
        asm: json["asm"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isApprovedAsm": isApprovedAsm,
        "saleOrderDate": saleOrderDate?.toIso8601String(),
        "customerId": customerId,
        "customerName": customerName,
        "subCustomerId": subCustomerId,
        "subCustomerName": subCustomerName,
        "orderNumber": orderNumber,
        "billAmount": billAmount,
        "salesPerson": salesPerson,
        "asm": asm
      };
}
