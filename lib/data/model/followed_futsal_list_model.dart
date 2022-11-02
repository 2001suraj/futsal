
class FollowedFutsalListModel {
  FollowedFutsalListModel({
      this.success, 
      this.statusCode, 
      this.message, 
      this.data,});

  FollowedFutsalListModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(FollowedFutsalListDataModel.fromJson(v));
      });
    }
  }
  bool? success;
  int? statusCode;
  String? message;
  List<FollowedFutsalListDataModel>? data;

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
class FollowedFutsalListDataModel {
  FollowedFutsalListDataModel({
    this.id,
    this.futsalName,
    this.address,
    this.contactNumber,
    this.email,
    this.facebook,
    this.website,
    this.openingDetails,
    this.lon,
    this.lat,
    this.logo,
    this.bannerImage,
    this.areaId,
    this.description,
    this.isDeletedFlag,
    this.status,});

  FollowedFutsalListDataModel.fromJson(dynamic json) {
    id = json['id'];
    futsalName = json['futsal_name'];
    address = json['address'];
    contactNumber = json['contact_number'];
    email = json['email'];
    facebook = json['facebook'];
    website = json['website'];
    openingDetails = json['opening_details'];
    lon = json['lon'];
    lat = json['lat'];
    logo = json['logo'];
    bannerImage = json['banner_image'];
    areaId = json['area_id'];
    description = json['description'];
    isDeletedFlag = json['is_deleted_flag'];
    status = json['status'];
  }
  String? id;
  String? futsalName;
  String? address;
  String? contactNumber;
  String? email;
  String? facebook;
  dynamic website;
  String? openingDetails;
  String? lon;
  String? lat;
  String? logo;
  String? bannerImage;
  String? areaId;
  String? description;
  String? isDeletedFlag;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['futsal_name'] = futsalName;
    map['address'] = address;
    map['contact_number'] = contactNumber;
    map['email'] = email;
    map['facebook'] = facebook;
    map['website'] = website;
    map['opening_details'] = openingDetails;
    map['lon'] = lon;
    map['lat'] = lat;
    map['logo'] = logo;
    map['banner_image'] = bannerImage;
    map['area_id'] = areaId;
    map['description'] = description;
    map['is_deleted_flag'] = isDeletedFlag;
    map['status'] = status;
    return map;
  }

}