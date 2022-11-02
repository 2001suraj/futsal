
class UserLoginModel {
  UserLoginModel({
      this.success, 
      this.statusCode, 
      this.userData, 
      this.message,});

  UserLoginModel.fromJson(Map<String,dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    userData = json['user_data'] != null ? UserDataModel.fromJson(json['user_data']) : null;
    message = json['message'];
  }
  bool? success;
  int? statusCode;
  UserDataModel? userData;
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
class UserDataModel {
  UserDataModel({
      this.id, 
      this.fullName, 
      this.mobileNumber, 
      this.status, 
      this.address, 
      this.email, 
      this.dob, 
      this.gender, 
      this.image,});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    mobileNumber = json['mobile_number'];
    status = json['status'];
    address = json['address'];
    email = json['email'];
    dob = json['dob'];
    gender = json['gender'];
    image = json['image'];
  }
  String? id;
  String? fullName;
  String? mobileNumber;
  String? status;
  String? address;
  String? email;
  String? dob;
  String? gender;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['mobile_number'] = mobileNumber;
    map['status'] = status;
    map['address'] = address;
    map['email'] = email;
    map['dob'] = dob;
    map['gender'] = gender;
    map['image'] = image;
    return map;
  }

}