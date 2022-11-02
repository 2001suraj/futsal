
class FutsalByAreaModel {
  FutsalByAreaModel({
      this.success, 
      this.statusCode, 
      this.userData, 
      this.message,});

  FutsalByAreaModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['user_data'] != null) {
      userData = [];
      json['user_data'].forEach((v) {
        userData!.add(FutsalByAreadataModel.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? success;
  int? statusCode;
  List<FutsalByAreadataModel>? userData;
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
class FutsalByAreadataModel {
  FutsalByAreadataModel({
    this.id,
    this.futsalName,
    this.address,
    this.contactNumber,
    this.email,
    this.openingDetails,
    this.lat,
    this.lon,
    this.logo,});

  FutsalByAreadataModel.fromJson(dynamic json) {
    id = json['id'];
    futsalName = json['futsal_name'];
    address = json['address'];
    contactNumber = json['contact_number'];
    email = json['email'];
    openingDetails = json['opening_details'];
    lat = json['lat'];
    lon = json['lon'];
    logo = json['logo'];
  }
  String? id;
  String? futsalName;
  String? address;
  String? contactNumber;
  String? email;
  String? openingDetails;
  String? lat;
  String? lon;
  String? logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['futsal_name'] = futsalName;
    map['address'] = address;
    map['contact_number'] = contactNumber;
    map['email'] = email;
    map['opening_details'] = openingDetails;
    map['lat'] = lat;
    map['lon'] = lon;
    map['logo'] = logo;
    return map;
  }

}