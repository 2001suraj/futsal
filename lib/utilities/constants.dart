// ignore_for_file: constant_identifier_names

class Constants {
// api url
  static const String baseUrl = 'https://futsalsansar.com/api/';
  static const String followFutsal = 'FollowFutsal/addFollower';
  static const String unfollowFutsal = 'FollowFutsal/removeFollower';
  static const String futsalBooking = 'Management/futsalBooking';
  static const String login = 'Login/login_process';
  static const String signup = 'Login/registration';
  static const String signupVerification = 'Login/userVerification';
  static const String allFutsalLocation = 'FutsalApi/getAllLocations';
  static const String futsalByArea =
      'FutsalApi/getFutsalDetailByArea?area_id=1';
  static const String futsalDetailsByName =
      'Nearby/getFutsalDetailMap?futsal_name=G4 Futsal';
  static const String futsalGroundList =
      'Management/futsalgroundList?futsal_id=6';
  static const String futsalReportCategory =
      'FutsalApi/futsalReportCategoryList';
  static const String homeSlider = 'Management/home';
  static const String paymentType = 'Management/paymentTypeList';
  static const String forgetPassword = 'Login/forgotPassword';
  static const String resetPassword = 'Login/changePassword';
  static const String updateUserProfile = 'Login/updateUserProfile';
  static const String reportFutsal = '/FutsalApi/reportFutsal';
  static const String cancelFutsalBooking = '/Management/cancelFutsalBooking';

  //x-api_key
  static const String ApiKey = 'x-api-key';
  static const String ApiKeyValue = 'm33ting*\$!';

  // Shared Preferences keys
  static const String id = 'id';
  static const String pass = 'pass';

  static const String mobile_no = 'mobile_no';
  static const String user_data = 'user_data';
}
