class URLConstants {
  static const baseUrl = "https://reqres.in/";

  ///API onBoarding************************************************************************
  static const signUpApiUrl = baseUrl + 'api/register/';
  static const loginApiUrl = baseUrl + 'api/login/';
  static const logoutApiUrl = baseUrl + 'api/users/logout/';

  //API ForgotPassword Email
  static const sendOtpEmail = baseUrl + 'api/users/sendOtpToEmail/';
  static const resentOtpEmail = baseUrl + 'api/users/resendOtpToEmail/';
  static const verifyOtpEmail = baseUrl + 'api/users/verifyOtpFromEmail';
  static const resetPassEmail = baseUrl + 'api/users/resetPasswordFromEmail';

  //API ForgotPassword Mobile
  static const sendOtpMbl = baseUrl + 'comm/sendOtp';
  static const resentOtpMbl = baseUrl + 'comm/resendOtp';
  static const verifyOtpMbl = baseUrl + 'comm/verifyOtp';
  static const resetPassFromMbl = baseUrl + 'api/users/resetPasswordFromPhone';

  //  ! Home Product
  static const prodUrl = baseUrl + '';
  static const homeUrl = baseUrl + 'api/unknown/';

  // ! Order and Cart
  static const cartUrl = baseUrl + '';
  static const cartItemPutUrl = baseUrl + '';
  static const cartItemDeleteUrl = baseUrl + '';
  static const wishlistUrl = baseUrl + '';
  static const wishlistItemPutUrl = baseUrl + '';
  static const wishlistItemDeleteUrl = baseUrl + '';
}
