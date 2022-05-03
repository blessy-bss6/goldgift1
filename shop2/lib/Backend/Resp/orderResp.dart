import 'dart:convert';

import 'package:dio/dio.dart';

import '../../utils/shared_helper.dart';
import '/utils/app_constants.dart';
import '/utils/http_services.dart';

class OrderRespo {
  Future<dynamic> orderGetDataResp({dynamic customer}) async {
    print(customer);
    String url = URLConstants.baseUrl +
        URLConstants.orderUrl +
        "?customer=$customer" +
        "&consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";

    // final response = await getDioRequest(url);
    try {
      Response response = await Dio().get(url);
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        // List<dynamic> valueList = jsonDecode(response.data);

        return response.data;
      } else {
        print(response);
        return response;
      }
    } on DioError catch (e) {}
  }

  Future<dynamic> orderPostResp(
      {dynamic billing,
      dynamic shipping,
      dynamic lineItem,
      dynamic payMode,
      dynamic userId,
      dynamic payTitle}) async {
    // String url2 =
    //     "https://liveprojects.co.in/goldgift/wp-json/wc/v3/orders?consumer_key=ck_e574cd75f0fedf68fda0fa8fd99c17f54665a4c6&consumer_secret=cs_9e084118b1fdba78c85c24b6a209fdf382057e5e";
    String url = URLConstants.baseUrl +
        URLConstants.orderUrl +
        "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";

    FormData formData = FormData.fromMap({
      "line_items": lineItem,
      "payment_method": "$payMode",
      "payment_method_title": "$payTitle",
      "billing": billing,
      "shipping": shipping,
      "customer_id": userId
    });

    try {
      Response response = await Dio().post(url, data: formData);

      // print(response.statusCode);
      // print(response.data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
        return false;
      }
    } on DioError catch (e) {
      // print('Response' + e.response!.data.toString());
      print(e);
      return e.response!.data;
    }
  }

  Future<dynamic> orderUpdateResp({dynamic customerId, dynamic orderId}) async {
    print("customerId $customerId");
      print("orderId $orderId");
    String url = URLConstants.baseUrl +
        URLConstants.orderUrl +
        "/$orderId" +
        "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";

    // final response = await getDioRequest(url);
    try {
      Response response =
          await Dio().put(url, data: {"customer_id": customerId});
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        // List<dynamic> valueList = jsonDecode(response.data);

        return response.data;
      } else {
        print(response);
        return false;
      }
    } on DioError catch (e) {}
  }

  Future<dynamic> orderDeleteResp({String? id}) async {
    String url = URLConstants.baseUrl +
        URLConstants.orderUrl +
        "/$id"
            "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";
    final response = await delDioRequest(
      url,
    );
    print(response);
    if (response) {
      return response;
    } else {
      print(response);
      return response;
    }
  }
}
