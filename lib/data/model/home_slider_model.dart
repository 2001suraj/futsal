

class HomeSliderModel {
  HomeSliderModel({
      this.success, 
      this.statusCode, 
      this.message, 
      this.data,});

  HomeSliderModel.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status_code'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }

}


class Data {
  Data({
    this.futsalSlider,
    this.homeSlider,
    this.eventSlider,});

  Data.fromJson(dynamic json) {
    if (json['futsal_slider'] != null) {
      futsalSlider = [];
      json['futsal_slider'].forEach((v) {
        futsalSlider!.add(FutsalSliderModel1.fromJson(v));
      });
    }
    if (json['home_slider'] != null) {
      homeSlider = [];
      json['home_slider'].forEach((v) {
        homeSlider!.add(HomeSliderMM.fromJson(v));
      });
    }
    if (json['event_slider'] != null) {
      eventSlider = [];
      json['event_slider'].forEach((v) {
        eventSlider!.add(EventSlider.fromJson(v));
      });
    }
  }
  List<FutsalSliderModel1>? futsalSlider;
  List<HomeSliderMM>? homeSlider;
  List<EventSlider>? eventSlider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (futsalSlider != null) {
      map['futsal_slider'] = futsalSlider!.map((v) => v.toJson()).toList();
    }
    if (homeSlider != null) {
      map['home_slider'] = homeSlider!.map((v) => v.toJson()).toList();
    }
    if (eventSlider != null) {
      map['event_slider'] = eventSlider!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}class EventSlider {
  EventSlider({
      this.id, 
      this.title, 
      this.image, 
      this.organizer, 
      this.email, 
      this.description, 
      this.venue, 
      this.date, 
      this.lon, 
      this.lat, 
      this.entryDesc, 
      this.contactNumber,});

  EventSlider.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    organizer = json['organizer'];
    email = json['email'];
    description = json['description'];
    venue = json['venue'];
    date = json['date'];
    lon = json['lon'];
    lat = json['lat'];
    entryDesc = json['entry_desc'];
    contactNumber = json['contact_number'];
  }
  String? id;
  String? title;
  String? image;
  String? organizer;
  String? email;
  String? description;
  String? venue;
  String? date;
  String? lon;
  String? lat;
  String? entryDesc;
  String? contactNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['organizer'] = organizer;
    map['email'] = email;
    map['description'] = description;
    map['venue'] = venue;
    map['date'] = date;
    map['lon'] = lon;
    map['lat'] = lat;
    map['entry_desc'] = entryDesc;
    map['contact_number'] = contactNumber;
    return map;
  }

}
class HomeSliderMM {
  HomeSliderMM({
      this.id, 
      this.image, 
      this.description, 
      this.title,});

  HomeSliderMM.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    description = json['description'];
    title = json['title'];
  }
  String? id;
  String? image;
  String? description;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['description'] = description;
    map['title'] = title;
    return map;
  }

}
class FutsalSliderModel1 {
  FutsalSliderModel1({
      this.id, 
      this.futsalName, 
      this.facebook, 
      this.openingDetails, 
      this.lon, 
      this.lat, 
      this.address, 
      this.logo, 
      this.groundCount,});

  FutsalSliderModel1.fromJson(dynamic json) {
    id = json['id'];
    futsalName = json['futsal_name'];
    facebook = json['facebook'];
    openingDetails = json['opening_details'];
    lon = json['lon'];
    lat = json['lat'];
    address = json['address'];
    logo = json['logo'];
    groundCount = json['ground_count'];
  }
  String? id;
  String? futsalName;
  String? facebook;
  String? openingDetails;
  String? lon;
  String? lat;
  String? address;
  String? logo;
  String? groundCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['futsal_name'] = futsalName;
    map['facebook'] = facebook;
    map['opening_details'] = openingDetails;
    map['lon'] = lon;
    map['lat'] = lat;
    map['address'] = address;
    map['logo'] = logo;
    map['ground_count'] = groundCount;
    return map;
  }

}
class CModel {
  CModel({
      this.id, 
      this.futsalName, 
      this.facebook, 
      this.openingDetails, 
      this.lon, 
      this.lat, 
      this.address, 
      this.logo, 
      this.groundCount,});

  CModel.fromJson(dynamic json) {
    id = json['id'];
    futsalName = json['futsal_name'];
    facebook = json['facebook'];
    openingDetails = json['opening_details'];
    lon = json['lon'];
    lat = json['lat'];
    address = json['address'];
    logo = json['logo'];
    groundCount = json['ground_count'];
  }
  String? id;
  String? futsalName;
  String? facebook;
  String? openingDetails;
  String? lon;
  String? lat;
  String? address;
  String? logo;
  String? groundCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['futsal_name'] = futsalName;
    map['facebook'] = facebook;
    map['opening_details'] = openingDetails;
    map['lon'] = lon;
    map['lat'] = lat;
    map['address'] = address;
    map['logo'] = logo;
    map['ground_count'] = groundCount;
    return map;
  }

}