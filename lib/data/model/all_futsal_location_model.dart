
class AllFutsalLocationModel {
  AllFutsalLocationModel({
      this.success, 
      this.statusCode, 
      this.userData, 
      this.message,});

  AllFutsalLocationModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['user_data'] != null) {
      userData = [];
      json['user_data'].forEach((v) {
        userData!.add(AllFutsalLocationDataModel.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? success;
  int? statusCode;
  List<AllFutsalLocationDataModel>? userData;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status_code'] = statusCode;
    if (userData != null) {
      map['user_data'] = userData!.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}
class AllFutsalLocationDataModel {
  AllFutsalLocationDataModel({
    this.areaId,
    this.areaName,});

  AllFutsalLocationDataModel.fromJson(dynamic json) {
    areaId = json['area_id'];
    areaName = json['area_name'];
  }
  String? areaId;
  String? areaName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['area_id'] = areaId;
    map['area_name'] = areaName;
    return map;
  }

}