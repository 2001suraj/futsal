
class VenueRuleModel {
  VenueRuleModel({
      this.success, 
      this.statusCode, 
      this.userData, 
      this.message,});

  VenueRuleModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    userData = json['user_data'] != null ? VenueRuleDataModel.fromJson(json['user_data']) : null;
    message = json['message'];
  }
  bool? success;
  int? statusCode;
  VenueRuleDataModel? userData;
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
class VenueRuleDataModel {
  VenueRuleDataModel({
      this.rules,});

  VenueRuleDataModel.fromJson(dynamic json) {
    rules = json['rules'];
  }
  String? rules;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rules'] = rules;
    return map;
  }

}