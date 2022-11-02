
class FutsalScheduleModel {
  FutsalScheduleModel({
      this.success, 
      this.statusCode, 
      this.message, 
      this.data,});

  FutsalScheduleModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(FutsalScheduleDataModel.fromJson(v));
      });
    }
  }
  bool? success;
  int? statusCode;
  String? message;
  List<FutsalScheduleDataModel>? data;

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
class FutsalScheduleDataModel {
  FutsalScheduleDataModel({
    this.scheduleId,
    this.startTime,
    this.price,
    this.totalGameTime,
    this.endTime,
    this.bookingStatus,});

  FutsalScheduleDataModel.fromJson(dynamic json) {
    scheduleId = json['schedule_id'];
    startTime = json['start_time'];
    price = json['price'];
    totalGameTime = json['total_game_time'];
    endTime = json['end_time'];
    bookingStatus = json['booking_status'];
  }
  String? scheduleId;
  String? startTime;
  String? price;
  String? totalGameTime;
  String? endTime;
  String? bookingStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['schedule_id'] = scheduleId;
    map['start_time'] = startTime;
    map['price'] = price;
    map['total_game_time'] = totalGameTime;
    map['end_time'] = endTime;
    map['booking_status'] = bookingStatus;
    return map;
  }

}