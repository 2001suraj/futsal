// ignore_for_file: file_names

class FutsalDetailsByNameModel {
  FutsalDetailsByNameModel({
      this.success, 
      this.statusCode, 
      this.message, 
      this.data,});

  FutsalDetailsByNameModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(FutsalDetailsByNameDataModel.fromJson(v));
      });
    }
  }
  bool? success;
  int? statusCode;
  String? message;
  List<FutsalDetailsByNameDataModel>? data;

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
class FutsalDetailsByNameDataModel {
  FutsalDetailsByNameDataModel({
    this.id,
    this.futsalName,
    this.logo,
    this.address,
    this.contactNumber,
    this.email,
    this.facebook,
    this.lon,
    this.lat,});

  FutsalDetailsByNameDataModel.fromJson(dynamic json) {
    id = json['id'];
    futsalName = json['futsal_name'];
    logo = json['logo'];
    address = json['address'];
    contactNumber = json['contact_number'];
    email = json['email'];
    facebook = json['facebook'];
    lon = json['lon'];
    lat = json['lat'];
  }
  String? id;
  String? futsalName;
  String? logo;
  String? address;
  String? contactNumber;
  String? email;
  String? facebook;
  String? lon;
  String? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['futsal_name'] = futsalName;
    map['logo'] = logo;
    map['address'] = address;
    map['contact_number'] = contactNumber;
    map['email'] = email;
    map['facebook'] = facebook;
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }

}