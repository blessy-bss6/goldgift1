// import '/utils/app_constants.dart';
// import '/utils/http_services.dart';

// class  CartWishListRespo {
//   Future<dynamic> cartResp() async {
//     final response = await getDioRequest(
//       URLConstants.signUpApiUrl,
//     );

//     if (response != null) {
//       return response;
//     } else {
//       print(response);
//       return response;
//     }
//   }

//   Future<dynamic> cartUpdateResp(
//       {String? email, String? phone, String? name, String? password}) async {
//     final response = await putDioRequest(
//       URLConstants.signUpApiUrl,
//       {"email": email, "password": password},
//     );
//     print(response);
//     if (response) {
//       return response;
//     } else {
//       print(response);
//       return response;
//     }
//   }

//   Future<dynamic> cartDeleteResp(
//       {String? email, String? phone, String? name, String? password}) async {
//     final response = await delDioRequest(
//       URLConstants.signUpApiUrl,
//       {"email": email, "password": password},
//     );
//     print(response);
//     if (response) {
//       return response;
//     } else {
//       print(response);
//       return response;
//     }
//   }

//   // ! Wishlist
//   Future<dynamic> wishlistResp() async {
//     final response = await getDioRequest(
//       URLConstants.signUpApiUrl,
//     );

//     if (response != null) {
//       return response;
//     } else {
//       print(response);
//       return response;
//     }
//   }

//   Future<dynamic> wishlistUpdateResp(
//       {String? email, String? phone, String? name, String? password}) async {
//     final response = await putDioRequest(
//       URLConstants.signUpApiUrl,
//       {"email": email, "password": password},
//     );
//     print(response);
//     if (response) {
//       return response;
//     } else {
//       print(response);
//       return response;
//     }
//   }

//   Future<dynamic> wishlistDeleteResp(
//       {String? email, String? phone, String? name, String? password}) async {
//     final response = await delDioRequest(
//       URLConstants.signUpApiUrl,
//       {"email": email, "password": password},
//     );
//     print(response);
//     if (response) {
//       return response;
//     } else {
//       print(response);
//       return response;
//     }
//   }
// }
