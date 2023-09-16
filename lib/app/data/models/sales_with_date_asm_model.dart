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
  final String? remarks;
  final String? notes;
  final String? saleType;
  final String? deliveryAddress;
  final String? deliveryContact;
  final String? personnelName;
  final int? personnelId;
  final int? finYearId;
  final String? finYear;
  final String? createBy;
  final DateTime? createDate;
  final DateTime? deliveryDate;
  final String? paymentMode;
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
    this.remarks,
    this.notes,
    this.saleType,
    this.deliveryAddress,
    this.deliveryContact,
    this.personnelName,
    this.personnelId,
    this.finYearId,
    this.finYear,
    this.createBy,
    this.createDate,
    this.deliveryDate,
    this.paymentMode,
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
        remarks: json["remarks"],
        notes: json["notes"],
        saleType: json["saleType"],
        deliveryAddress: json["deliveryAddress"],
        deliveryContact: json["deliveryContact"],
        personnelName: json["personnelName"],
        personnelId: json["personnelId"],
        finYearId: json["finYearId"],
        finYear: json["finYear"],
        createBy: json["createBy"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        deliveryDate: json["deliveryDate"] == null
            ? null
            : DateTime.parse(json["deliveryDate"]),
        paymentMode: json["paymentMode"],
        isApprovedAsm: json["isApprovedAsm"],
        saleOrderDate: json["saleOrderDate"] == null
            ? null
            : DateTime.parse(json["saleOrderDate"]),
        customerId: json["customerId"],
        customerName: json["customerName"],
        subCustomerId: json["subCustomerId"],
        subCustomerName: json["subCustomerName"],
        orderNumber: json["orderNumber"],
        billAmount: json["billAmount"],
        salesPerson: json["salesPerson"],
        asm: json["asm"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "remarks": remarks,
        "notes": notes,
        "saleType": saleType,
        "deliveryAddress": deliveryAddress,
        "deliveryContact": deliveryContact,
        "personnelName": personnelName,
        "personnelId": personnelId,
        "finYearId": finYearId,
        "finYear": finYear,
        "createBy": createBy,
        "createDate": createDate?.toIso8601String(),
        "deliveryDate": deliveryDate?.toIso8601String(),
        "paymentMode": paymentMode,
        "isApprovedAsm": isApprovedAsm,
        "saleOrderDate": saleOrderDate?.toIso8601String(),
        "customerId": customerId,
        "customerName": customerName,
        "subCustomerId": subCustomerId,
        "subCustomerName": subCustomerName,
        "orderNumber": orderNumber,
        "billAmount": billAmount,
        "salesPerson": salesPerson,
        "asm": asm,
      };
}
