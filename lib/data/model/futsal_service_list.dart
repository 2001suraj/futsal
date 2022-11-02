
class FutsalServiceListModel {
  FutsalServiceListModel({
      this.success, 
      this.statusCode, 
      this.userData, 
      this.message,});

  FutsalServiceListModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    userData = json['user_data'] != null ? FutsalServiceListDataModel.fromJson(json['user_data']) : null;
    message = json['message'];
  }
  bool? success;
  int? statusCode;
  FutsalServiceListDataModel? userData;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status_code'] = statusCode;
    if (userData != null) {
      map['user_data'] = userData!.toJson();
    }
    map['message'] = message;
    return map;
  }

}
class FutsalServiceListDataModel {
  FutsalServiceListDataModel({
      this.services,});

  FutsalServiceListDataModel.fromJson(dynamic json) {
    services = json['services'];
  }
  String? services;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['services'] = services;
    return map;
  }

}