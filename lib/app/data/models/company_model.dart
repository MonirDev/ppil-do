class CompanyModel {
  final int? id;
  final String? userName;
  final String? phone;
  final String? companyName;
  final String? companyAddress;
  final int? companyId;
  final int? userId;

  CompanyModel({
    this.id,
    this.userName,
    this.phone,
    this.companyName,
    this.companyAddress,
    this.companyId,
    this.userId,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json["id"],
        userName: json["userName"],
        phone: json["phone"],
        companyName: json["companyName"],
        companyAddress: json["companyAddress"],
        companyId: json["companyId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "phone": phone,
        "companyName": companyName,
        "companyAddress": companyAddress,
        "companyId": companyId,
        "userId": userId,
      };
}
