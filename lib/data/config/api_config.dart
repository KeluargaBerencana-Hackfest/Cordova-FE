class ApiConfig {
  static const baseUrl = "https://cordova-server-999a9c422c84.herokuapp.com/";
  static const signUp = "${baseUrl}api/v1/auth/signup";
  static const signIn = "${baseUrl}api/v1/auth/signin";

  static const getCholesterolHistory = "${baseUrl}api/v1/cholesterol/history";
  static const checkCholesterol = "${baseUrl}api/v1/cholesterol/check";

  static const updateUser = "${baseUrl}api/v1/user/update";
  static const updatePhotoProfile =
      "${baseUrl}api/v1/user/update/photo-profile";

  static const getAllActivity = "${baseUrl}api/v1/activity/all";
}
