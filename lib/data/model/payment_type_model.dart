
class PaymentTypeModel {
  PaymentTypeModel({
      this.success, 
      this.statusCode, 
      this.data, 
      this.message,});

  PaymentTypeModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(PaymentTypeDataModel.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? success;
  int? statusCode;
  List<PaymentTypeDataModel>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status_code'] = statusCode;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}
class PaymentTypeDataModel {
  PaymentTypeDataModel({
    this.paymentTypeId,
    this.name,});

  PaymentTypeDataModel.fromJson(dynamic json) {
    paymentTypeId = json['payment_type_id'];
    name = json['name'];
  }
  String? paymentTypeId;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payment_type_id'] = paymentTypeId;
    map['name'] = name;
    return map;
  }

}