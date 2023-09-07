class SalesWithDateListModel {
  List<SalesWithDateModel> salesWithDateList;
  SalesWithDateListModel({
    required this.salesWithDateList,
  });
  factory SalesWithDateListModel.fromJson(List<dynamic>? json) =>
      SalesWithDateListModel(
        salesWithDateList: json == null || json.isEmpty
            ? []
            : json.map((e) => SalesWithDateModel.fromJson(e)).toList(),
      );
}

class SalesWithDateModel {
  final int? id;
  final int? customerId;
  final Customer? customer;
  final int? subCustomerId;
  final SubCustomer? subCustomer;
  final String? orderNumber;
  final bool? isReadAsm;
  final bool? isApprovedAsm;
  final bool? isReadDeliSec;
  final bool? isApprovedDeliSec;
  final bool? isDelivered;
  final bool? isSold;
  final DateTime? saleOrderDate;
  final double? billAmount;
  final double? paidAmount;
  final double? dueAmount;
  final String? remarks;
  final String? notes;
  final String? status;
  final String? saleType;
  final String? paymentMode;
  final String? deliveryAddress;
  final String? deliveryContact;
  // final String? workOrderNo;
  final String? deliveryPoint;
  final String? driverName;
  // final String? driverPhone;
  // final String? truckNo;
  final DateTime? deliveryDate;
  final String? personnelName;
  final int? personnelId;
  final String? employee;
  final double? exDisPercent;
  final double? exDisAmount;
  // final String? finYear;
  // final int? finYearId;
  // final int? editable;
  final List<SaleOrderMapping>? saleOrderMappings;
  // final String? createBy;
  // final String? updateBy;
  final DateTime? createDate;
  final DateTime? updateDate;

  SalesWithDateModel({
    this.id,
    this.customerId,
    this.customer,
    this.subCustomerId,
    this.subCustomer,
    this.orderNumber,
    this.isReadAsm,
    this.isApprovedAsm,
    this.isReadDeliSec,
    this.isApprovedDeliSec,
    this.isDelivered,
    this.isSold,
    this.saleOrderDate,
    this.billAmount,
    this.paidAmount,
    this.dueAmount,
    this.remarks,
    this.notes,
    this.status,
    this.saleType,
    this.paymentMode,
    this.deliveryAddress,
    this.deliveryContact,
    // this.workOrderNo,
    this.deliveryPoint,
    this.driverName,
    // this.driverPhone,
    // this.truckNo,
    this.deliveryDate,
    this.personnelName,
    this.personnelId,
    this.employee,
    this.exDisPercent,
    this.exDisAmount,
    // this.finYear,
    // this.finYearId,
    // this.editable,
    this.saleOrderMappings,
    // this.createBy,
    // this.updateBy,
    this.createDate,
    this.updateDate,
  });

  factory SalesWithDateModel.fromJson(Map<String, dynamic> json) =>
      SalesWithDateModel(
        id: json["id"],
        customerId: json["customerId"],
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        subCustomerId: json["subCustomerId"],
        subCustomer: json["subCustomer"] == null
            ? null
            : SubCustomer.fromJson(json["subCustomer"]),
        orderNumber: json["orderNumber"],
        isReadAsm: json["isReadAsm"],
        isApprovedAsm: json["isApprovedAsm"],
        isReadDeliSec: json["isReadDeliSec"],
        isApprovedDeliSec: json["isApprovedDeliSec"],
        isDelivered: json["isDelivered"],
        isSold: json["isSold"],
        saleOrderDate: json["saleOrderDate"] == null
            ? null
            : DateTime.parse(json["saleOrderDate"]),
        billAmount: json["billAmount"]?.toDouble(),
        paidAmount: json["paidAmount"],
        dueAmount: json["dueAmount"]?.toDouble(),
        remarks: json["remarks"],
        notes: json["notes"],
        status: json["status"],
        saleType: json["saleType"],
        paymentMode: json["paymentMode"],
        deliveryAddress: json["deliveryAddress"],
        deliveryContact: json["deliveryContact"],
        // workOrderNo: json["workOrderNo"],
        deliveryPoint: json["deliveryPoint"],
        driverName: json["driverName"],
        // driverPhone: json["driverPhone"],
        // truckNo: json["truckNo"],
        deliveryDate: json["deliveryDate"] == null
            ? null
            : DateTime.parse(json["deliveryDate"]),
        personnelName: json["personnelName"],
        personnelId: json["personnelId"],
        employee: json["employee"],
        exDisPercent: json["exDisPercent"],
        exDisAmount: json["exDisAmount"],
        // finYear: json["finYear"],
        // finYearId: json["finYearId"],
        // editable: json["editable"],
        saleOrderMappings: json["saleOrderMappings"] == null
            ? []
            : List<SaleOrderMapping>.from(json["saleOrderMappings"]!
                .map((x) => SaleOrderMapping.fromJson(x))),
        // createBy: json["createBy"],
        // updateBy: json["updateBy"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        updateDate: json["updateDate"] == null
            ? null
            : DateTime.parse(json["updateDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerId": customerId,
        "customer": customer?.toJson(),
        "subCustomerId": subCustomerId,
        "subCustomer": subCustomer?.toJson(),
        "orderNumber": orderNumber,
        "isReadAsm": isReadAsm,
        "isApprovedAsm": isApprovedAsm,
        "isReadDeliSec": isReadDeliSec,
        "isApprovedDeliSec": isApprovedDeliSec,
        "isDelivered": isDelivered,
        "isSold": isSold,
        "saleOrderDate": saleOrderDate?.toIso8601String(),
        "billAmount": billAmount,
        "paidAmount": paidAmount,
        "dueAmount": dueAmount,
        "remarks": remarks,
        "notes": notes,
        "status": status,
        "saleType": saleType,
        "paymentMode": paymentMode,
        "deliveryAddress": deliveryAddress,
        "deliveryContact": deliveryContact,
        // "workOrderNo": workOrderNo,
        "deliveryPoint": deliveryPoint,
        "driverName": driverName,
        // "driverPhone": driverPhone,
        // "truckNo": truckNo,
        "deliveryDate": deliveryDate?.toIso8601String(),
        "personnelName": personnelName,
        "personnelId": personnelId,
        "employee": employee,
        "exDisPercent": exDisPercent,
        "exDisAmount": exDisAmount,
        // "finYear": finYear,
        // "finYearId": finYearId,
        // "editable": editable,
        "saleOrderMappings": saleOrderMappings == null
            ? []
            : List<dynamic>.from(saleOrderMappings!.map((x) => x.toJson())),
        // "createBy": createBy,
        // "updateBy": updateBy,
        "createDate": createDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
      };
}

class Customer {
  final int? id;
  final String? name;
  final String? engName;
  final String? email;
  final String? phone;
  // final String? tradeLicese;
  // final String? nid;
  // final String? chequeNo;
  // final String? bankName;
  final String? contactPerson;
  final String? contactNumber;
  final String? address;
  final String? remarks;
  // final String? fileNo;
  // final String? refName;
  final String? customerType;
  // final String? status;
  // final String? photoPath;
  final int? personnelId;
  // final int? level4Id;
  final double? discountOffer;
  // final String? createBy;
  // final String? updateBy;
  final DateTime? createDate;
  final DateTime? updateDate;

  Customer({
    this.id,
    this.name,
    this.engName,
    this.email,
    this.phone,
    // this.tradeLicese,
    // this.nid,
    // this.chequeNo,
    // this.bankName,
    this.contactPerson,
    this.contactNumber,
    this.address,
    this.remarks,
    // this.fileNo,
    // this.refName,
    this.customerType,
    // this.status,
    // this.photoPath,
    this.personnelId,
    // this.level4Id,
    this.discountOffer,
    // this.createBy,
    // this.updateBy,
    this.createDate,
    this.updateDate,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        engName: json["engName"],
        email: json["email"],
        phone: json["phone"],
        // tradeLicese: json["tradeLicese"],
        // nid: json["nid"],
        // chequeNo: json["chequeNo"],
        // bankName: json["bankName"],
        contactPerson: json["contactPerson"],
        contactNumber: json["contactNumber"],
        address: json["address"],
        remarks: json["remarks"],
        // fileNo: json["fileNo"],
        // refName: json["refName"],
        customerType: json["customerType"],
        // status: json["status"],
        // photoPath: json["photoPath"],
        personnelId: json["personnelId"],
        // level4Id: json["level4Id"],
        discountOffer: json["discountOffer"],
        // createBy: json["createBy"],
        // updateBy: json["updateBy"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        updateDate: json["updateDate"] == null
            ? null
            : DateTime.parse(json["updateDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "engName": engName,
        "email": email,
        "phone": phone,
        // "tradeLicese": tradeLicese,
        // "nid": nid,
        // "chequeNo": chequeNo,
        // "bankName": bankName,
        "contactPerson": contactPerson,
        "contactNumber": contactNumber,
        "address": address,
        "remarks": remarks,
        // "fileNo": fileNo,
        // "refName": refName,
        "customerType": customerType,
        // "status": status,
        // "photoPath": photoPath,
        "personnelId": personnelId,
        // "level4Id": level4Id,
        "discountOffer": discountOffer,
        // "createBy": createBy,
        // "updateBy": updateBy,
        "createDate": createDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
      };
}

class SaleOrderMapping {
  final int? id;
  final int? saleOrderId;
  final int? productItemId;
  final String? productItems;
  final double? saleQty;
  final double? freeQty;
  final double? saleRate;
  final double? purchaseRate;
  final double? total;
  final double? commPercent;
  final double? discountAmount;
  final double? netAmount;
  // final String? finYear;
  // final int? finYearId;
  // final String? createBy;
  // final String? updateBy;
  final DateTime? createDate;
  final DateTime? updateDate;

  SaleOrderMapping({
    this.id,
    this.saleOrderId,
    this.productItemId,
    this.productItems,
    this.saleQty,
    this.freeQty,
    this.saleRate,
    this.purchaseRate,
    this.total,
    this.commPercent,
    this.discountAmount,
    this.netAmount,
    // this.finYear,
    // this.finYearId,
    // this.createBy,
    // this.updateBy,
    this.createDate,
    this.updateDate,
  });

  factory SaleOrderMapping.fromJson(Map<String, dynamic> json) =>
      SaleOrderMapping(
        id: json["id"],
        saleOrderId: json["saleOrderId"],
        productItemId: json["productItemId"],
        productItems: json["productItems"],
        saleQty: json["saleQty"],
        freeQty: json["freeQty"],
        saleRate: json["saleRate"],
        purchaseRate: json["purchaseRate"],
        total: json["total"],
        commPercent: json["commPercent"],
        discountAmount: json["discountAmount"],
        netAmount: json["netAmount"]?.toDouble(),
        // finYear: json["finYear"],
        // finYearId: json["finYearId"],
        // createBy: json["createBy"],
        // updateBy: json["updateBy"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        updateDate: json["updateDate"] == null
            ? null
            : DateTime.parse(json["updateDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "saleOrderId": saleOrderId,
        "productItemId": productItemId,
        "productItems": productItems,
        "saleQty": saleQty,
        "freeQty": freeQty,
        "saleRate": saleRate,
        "purchaseRate": purchaseRate,
        "total": total,
        "commPercent": commPercent,
        "discountAmount": discountAmount,
        "netAmount": netAmount,
        // "finYear": finYear,
        // "finYearId": finYearId,
        // "createBy": createBy,
        // "updateBy": updateBy,
        "createDate": createDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
      };
}

class SubCustomer {
  final int? id;
  final String? subCustomerName;
  final int? customerId;
  final Customer? customers;
  final String? email;
  final String? phone;
  final String? contactPerson;
  final String? contactNumber;
  final String? address;
  // final String? remarks;
  // final String? fileNo;
  // final String? refName;
  // final String? status;
  final String? photoPath;
  final double? discountOffer;
  // final String? createBy;
  // final String? updateBy;
  final DateTime? createDate;
  final DateTime? updateDate;

  SubCustomer({
    this.id,
    this.subCustomerName,
    this.customerId,
    this.customers,
    this.email,
    this.phone,
    this.contactPerson,
    this.contactNumber,
    this.address,
    // this.remarks,
    // this.fileNo,
    // this.refName,
    // this.status,
    this.photoPath,
    this.discountOffer,
    // this.createBy,
    // this.updateBy,
    this.createDate,
    this.updateDate,
  });

  factory SubCustomer.fromJson(Map<String, dynamic> json) => SubCustomer(
        id: json["id"],
        subCustomerName: json["subCustomerName"],
        customerId: json["customerId"],
        customers: json["customers"] == null
            ? null
            : Customer.fromJson(json["customers"]),
        email: json["email"],
        phone: json["phone"],
        contactPerson: json["contactPerson"],
        contactNumber: json["contactNumber"],
        address: json["address"],
        // remarks: json["remarks"],
        // fileNo: json["fileNo"],
        // refName: json["refName"],
        // status: json["status"],
        photoPath: json["photoPath"],
        discountOffer: json["discountOffer"],
        // createBy: json["createBy"],
        // updateBy: json["updateBy"],
        createDate: json["createDate"] == null
            ? null
            : DateTime.parse(json["createDate"]),
        updateDate: json["updateDate"] == null
            ? null
            : DateTime.parse(json["updateDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subCustomerName": subCustomerName,
        "customerId": customerId,
        "customers": customers?.toJson(),
        "email": email,
        "phone": phone,
        "contactPerson": contactPerson,
        "contactNumber": contactNumber,
        "address": address,
        // "remarks": remarks,
        // "fileNo": fileNo,
        // "refName": refName,
        // "status": status,
        "photoPath": photoPath,
        "discountOffer": discountOffer,
        // "createBy": createBy,
        // "updateBy": updateBy,
        "createDate": createDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
      };
}
