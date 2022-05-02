import 'package:dio/dio.dart';
import 'package:shop2/utils/app_constants.dart';
import 'package:wp_json_api/models/responses/wp_user_login_response.dart';
import 'package:wp_json_api/wp_json_api.dart';
import 'dart:convert';
import '../../utils/shared_helper.dart';

class RegLoginResp {
  //  Future<dynamic> curretnUserResp(
  //     {dynamic username}) async {
  //   try {
  //     Response response = await Dio().post(
  //         "https://liveprojects.co.in/goldgift/wp-json/wc/v3/customers" +
  //             "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}",
  //         // data: formData,
  //         data: {"email": email, "password": password, "username": username}
  //         // data: formData
  //         );
  //     print('response User ${response.statusCode}');

  //     print(response.statusCode);
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       print(response.data);

  //       loginResp(username: username, password: password);
  //       return true;
  //     }

  //     return false;
  //   } on DioError catch (e) {
  //     print(e);
  //     return e.response!.data;
  //   }
  // }      // print("resp email ${email.runtimeType}");
  //     // print("resp password $password");
  //     print("respusernam $username");

  Future<dynamic> registerResp(
      {dynamic email,
      dynamic password,
      dynamic username,
      dynamic context}) async {
    try {
      // print("resp email ${email.runtimeType}");
      // print("resp password $password");
      // print("respusernam $username");

      Response response = await Dio().post(
          "https://liveprojects.co.in/goldgift/wp-json/wc/v3/customers" +
              "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}",
          // data: formData,
          data: {"email": email, "password": password, "username": username}
          // data: formData
          );
      print('response User ${response.statusCode}');

      print(response.statusCode);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.data);

        loginResp(email: email, password: password);
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
      {dynamic email, dynamic password, dynamic context}) async {
    try {
      // print("resp email ${email.runtimeType}");
      //     print("resp email ${email}");
      String url = "https://liveprojects.co.in/goldgift/wp-json/wc/v3/customers" +
          "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}&email=${email}";
      Response res2 = await Dio().get(url);
      // print(res2.statusCode);
      // print(res2.data[0]['username']);
      if (res2.statusCode == 200) {
        Response response = await Dio().post(
          "https://liveprojects.co.in/goldgift/wp-json/api/v1/token",
          data: {
            "username": res2.data[0]['username'],
            "password": password,
          },
        );
        // print(response.statusCode);

        Map valueMap = jsonDecode(response.data);

        print(valueMap);
        // print(valueMap['jwt_token'].id);
        if (valueMap['jwt_token'] != null) {
          setCurrentUser(valueMap['jwt_token']);
          setUserType(res2.data[0]['id']);
          getCurrentUser();

          return true;
        }
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
void setUserType(idType) async {
  if (idType != null) {
    var v = SharedHelper().setUserTypeScr('userIdType', idType);
  }
}

Future<bool> getUserType() async {
  SharedHelper shared = SharedHelper();
  dynamic idType = await shared.getUserTypeScr('userIdType');

  print('getCureent user ${idType}');
  return idType;
}
