class SubCustomerListModel {
  List<SubCustomerModel> subCustomerlist;
  SubCustomerListModel({
    required this.subCustomerlist,
  });
  factory SubCustomerListModel.fromJson(List<dynamic>? json) =>
      SubCustomerListModel(
        subCustomerlist: json == null || json.isEmpty
            ? []
            : json.map((e) => SubCustomerModel.fromJson(e)).toList(),
      );
}

class SubCustomerModel {
  final int? id;
  final String? name;
  final String? engName;
  final String? email;
  final String? phone;
  final String? contactPerson;
  final String? contactNumber;
  final String? deliveryAddress;
  // final String? remarks;
  // final String? fileNo;
  // final String? refName;
  // final String? status;
  final String? customerType;
  final String? photoPath;
  final int? personnelId;
  final String? personnelName;
  final double? discountOffer;
  final String? subCustomerName;
  final int? customerId;
  // final int? level4Id;
  final String? customerName;

  SubCustomerModel({
    this.id,
    this.name,
    this.engName,
    this.email,
    this.phone,
    this.contactPerson,
    this.contactNumber,
    this.deliveryAddress,
    // this.remarks,
    // this.fileNo,
    // this.refName,
    // this.status,
    this.customerType,
    this.photoPath,
    this.personnelId,
    this.personnelName,
    this.discountOffer,
    this.subCustomerName,
    this.customerId,
    // this.level4Id,
    this.customerName,
  });

  factory SubCustomerModel.fromJson(Map<String, dynamic> json) =>
      SubCustomerModel(
        id: json["id"],
        name: json["name"],
        engName: json["engName"],
        email: json["email"],
        phone: json["phone"],
        contactPerson: json["contactPerson"],
        contactNumber: json["contactNumber"],
        deliveryAddress: json["deliveryAddress"],
        // remarks: json["remarks"],
        // fileNo: json["fileNo"],
        // refName: json["refName"],
        // status: json["status"],
        customerType: json["customerType"],
        photoPath: json["photoPath"],
        personnelId: json["personnelId"],
        personnelName: json["personnelName"],
        discountOffer: json["discountOffer"],
        subCustomerName: json["subCustomerName"],
        customerId: json["customerId"],
        // level4Id: json["level4Id"],
        customerName: json["customerName"],
      );
}
