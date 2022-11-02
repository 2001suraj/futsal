
class FutsalReportCategoryListModel {
  FutsalReportCategoryListModel({
      this.success, 
      this.statusCode, 
      this.message, 
      this.data,});

  FutsalReportCategoryListModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(FutsalReportCategoryListDataModel.fromJson(v));
      });
    }
  }
  bool? success;
  int? statusCode;
  String? message;
  List<FutsalReportCategoryListDataModel>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status_code'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class FutsalReportCategoryListDataModel {
  FutsalReportCategoryListDataModel({
    this.issueId,
    this.issueName,});

  FutsalReportCategoryListDataModel.fromJson(dynamic json) {
    issueId = json['issue_id'];
    issueName = json['issue_name'];
  }
  String? issueId;
  String? issueName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['issue_id'] = issueId;
    map['issue_name'] = issueName;
    return map;
  }

}