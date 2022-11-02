
// ignore_for_file: file_names

class UserBookedFutsalListModel {
  UserBookedFutsalListModel({
      this.success, 
      this.statusCode, 
      this.message, 
      this.data,});

  UserBookedFutsalListModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(UserBookedFutsalListDataModel.fromJson(v));
      });
    }
  }
  bool? success;
  int? statusCode;
  String? message;
  List<UserBookedFutsalListDataModel>? data;

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
class UserBookedFutsalListDataModel {
  UserBookedFutsalListDataModel({
    this.futsalName,
    this.bookingId,
    this.address,
    this.logo,
    this.bookingDate,
    this.status,
    this.entryDate,
    this.startTime,
    this.totalGameTime,
    this.endTime,
    this.netPrice,
    this.groundName,});

  UserBookedFutsalListDataModel.fromJson(dynamic json) {
    futsalName = json['futsal_name'];
    bookingId = json['booking_id'];
    address = json['address'];
    logo = json['logo'];
    bookingDate = json['booking_date'];
    status = json['status'];
    entryDate = json['entry_date'];
    startTime = json['start_time'];
    totalGameTime = json['total_game_time'];
    endTime = json['end_time'];
    netPrice = json['net_price'];
    groundName = json['ground_name'];
  }
  String? futsalName;
  String? bookingId;
  String? address;
  String? logo;
  String? bookingDate;
  String? status;
  String? entryDate;
  String? startTime;
  String? totalGameTime;
  String? endTime;
  String? netPrice;
  String? groundName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['futsal_name'] = futsalName;
    map['booking_id'] = bookingId;
    map['address'] = address;
    map['logo'] = logo;
    map['booking_date'] = bookingDate;
    map['status'] = status;
    map['entry_date'] = entryDate;
    map['start_time'] = startTime;
    map['total_game_time'] = totalGameTime;
    map['end_time'] = endTime;
    map['net_price'] = netPrice;
    map['ground_name'] = groundName;
    return map;
  }

}