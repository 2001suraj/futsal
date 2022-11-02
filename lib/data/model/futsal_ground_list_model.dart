
class FutsalGroundListModel {
  FutsalGroundListModel({
      this.success, 
      this.statusCode, 
      this.userData, 
      this.message,});

  FutsalGroundListModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['user_data'] != null) {
      userData = [];
      json['user_data'].forEach((v) {
        userData!.add(FutsalGroundListDataModel.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? success;
  int? statusCode;
  List<FutsalGroundListDataModel>? userData;
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
class FutsalGroundListDataModel {
  FutsalGroundListDataModel({
    this.futsalId,
    this.groundId,
    this.groundName,});

  FutsalGroundListDataModel.fromJson(dynamic json) {
    futsalId = json['futsal_id'];
    groundId = json['ground_id'];
    groundName = json['ground_name'];
  }
  String? futsalId;
  String? groundId;
  String? groundName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['futsal_id'] = futsalId;
    map['ground_id'] = groundId;
    map['ground_name'] = groundName;
    return map;
  }

}