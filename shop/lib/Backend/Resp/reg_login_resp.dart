// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// import 'package:shop/Backend/Model/user.dart';
// import 'package:shop/utils/app_constants.dart';
// import 'package:shop/utils/http_services.dart';
// import 'package:shop/utils/shared_helper.dart';

// class RegLoginResp {
//   Future<dynamic> registerResp(
//       {String? email, String? phone, String? name, String? password}) async {
//     final response = await postDioRequest(
//       URLConstants.signUpApiUrl,
//       data: {"email": email, "password": password},
//     );
//     print(response);
//     if (response != null) {
//       setCurrentUser(response);
//       currentUser.value = User.fromJSON(response);

//       // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
//       currentUser.notifyListeners();
//       return true;
//     } else {
//       print(response);
//       return response;
//     }
//   }

// // ! Login Respositry
//   Future<dynamic> loginResp({String? email, String? password}) async {
//     final response = await postDioRequest(
//       URLConstants.loginApiUrl,
//       data: {"email": email, "password": password},
//     );
//     print(response);
//     // print(response.statusCode);
//     if (response != null) {
//       // print(response);
//       setCurrentUser(response);
//       currentUser.value = User.fromJSON(response);

//       // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
//       currentUser.notifyListeners();

//       return true;
//     } else {
//       return response;
//     }
//   }
// }

// void setCurrentUser(response) async {
//   if (response != null) {
//     SharedHelper().setString('current_user', json.encode(response));
//   }
// }

// Future<User> getCurrentUser() async {
//   SharedHelper shared = SharedHelper();
//   currentUser.value =
//       User.fromJSON(json.decode(await shared.getString('current_user')));

//   // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
//   currentUser.notifyListeners();
//   return currentUser.value;
// }

// Future<void> logout() async {
//   currentUser.value = User();
//   await SharedHelper().remove('current_user');
// }
