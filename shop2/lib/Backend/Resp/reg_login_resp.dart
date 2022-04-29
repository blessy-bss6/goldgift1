import 'package:dio/dio.dart';
import 'package:shop2/utils/app_constants.dart';

import '../../utils/shared_helper.dart';

class RegLoginResp {
  Future<dynamic> registerResp(
      {String? email,
      String? password,
      String? username,
      dynamic context}) async {
    try {
      print("resp email $email");
      print("resp password $password");
      print("respusernam $username");
      FormData formData = FormData.fromMap(
          {"email": email, "password": password, "username": username});

      Response response = await Dio().post(
        // URLConstants.signUpUrl +
        //     "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}",
        // URLConstants.signUpUrl,
     "https://liveprojects.co.in/goldgift/wp-json/wc/v3/customers?consumer_key=ck_e574cd75f0fedf68fda0fa8fd99c17f54665a4c6&consumer_secret=cs_9e084118b1fdba78c85c24b6a209fdf382057e5e",
        // data: formData,
        data: {"email": email, "password": password, "username": username}
      );
      print('response User ${response.statusCode}');

      //   FormData formData2 = FormData.fromMap(
      //     {"email": email, "password": "$password", "username": username});
      //  Response response2 = await Dio().post(
      //   // URLConstants.loginUrl,
      //   "https://liveprojects.co.in/goldgift/wp-json/api/v1/token",
      //   data:formData2,
      // );
      print(response.statusCode);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.data);
        // if (response2.data['jwt_token'] != null) {
        //   print(response2.data['jwt_token']);
        //   setCurrentUser(response2.data['jwt_token']);
        // setUserType(response.data['isIdType']);
        loginResp(username: username, password: password);
        return true;
      }

      return false;
    } on DioError catch (e) {
      print(e);
      return e.response!.data;
    }
  }

// ! Login Respositry
  Future<dynamic> loginResp(
      {String? username, String? password, dynamic context}) async {
    try {
      print(username);
      print(password);

      // FormData formData =
      //     FormData.fromMap({"password": password, "username": username});

      Response response = await Dio().post(
        "https://liveprojects.co.in/goldgift/wp-json/api/v1/token",
        // data: formData
        data: {
          "username": username,
          "password": password,
        },
        // options: Options(headers: {
        //   "Access-Control-Allow-Origin":
        //       "*", // Required for CORS support to work
        //   "Access-Control-Allow-Credentials":
        //       true, // Required for cookies, authorization headers with HTTPS
        //   "Access-Control-Allow-Headers":
        //       "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        //   "Access-Control-Allow-Methods": "POST, OPTIONS"
        // }
        // )
      );
      print(response.statusCode);

      print(response.data);
      // dynamic dat = response.data as Map;
      // print(dat);
      print(response.data["jwt_token"]);
      if (response.data['jwt_token'] != null) {
        setCurrentUser(response.data['jwt_token']);
        // setUserType(response.data['isIdType']);
        getCurrentUser();

        return true;
      }

      return false;
    } on DioError catch (e) {
      print(e);
      print(e.response!.headers);
      return e.response!.data;
    }
  }
}

// ! User Token
void setCurrentUser(response) async {
  if (response != null) {
    var v = SharedHelper().setString('current_user', response);
  }
}

Future<String> getCurrentUser() async {
  SharedHelper shared = SharedHelper();
  dynamic tokn = await shared.getString('current_user');

  print('getCureent user ${tokn}');
  return tokn;
}

// ! LOGOUT METHOD
Future<void> logout() async {
  // currentUser.value = User();
  await SharedHelper().remove('current_user');
  await SharedHelper().remove('userIdType');
}

// ! CURRENT Screen
// void setUserType(idType) async {
//   if (idType != null) {
//     var v = SharedHelper().setUserTypeScr('userIdType', idType);
//   }
// }

// Future<bool> getUserType() async {
//   SharedHelper shared = SharedHelper();
//   dynamic idType = await shared.getUserTypeScr('userIdType');

//   // print('getCureent user ${idType}');
//   return idType;
// }
