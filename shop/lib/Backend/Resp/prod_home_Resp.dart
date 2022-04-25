import 'dart:html';
import 'dart:io';

import 'package:dio/dio.dart';

import '/utils/app_constants.dart';
import '/utils/http_services.dart';

class ProdHomeRespo {
  Future<dynamic> prodResp() async {
    String url = URLConstants.baseUrl +
        URLConstants.productUrl +
        "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";

    final response = await getDioRequest(url);
    // print(response);
    if (response != null) {
      return response;
    } else {
      // print(response);
      return response;
    }
  }

  Future<dynamic> homeResp() async {
    // final response =
    //     await getDioRequest("https://liveprojects.co.in/goldgift/");
    var prod = prodResp();
    var cate = categoryResp();
    // print(prod);

    if (prod != null || cate != null) {
      return {"prod": prod, "cate": cate};
    } else {
      return false;
    }

    // print(response);
    // if (response != null) {
    //   return response;
    // } else {
    //   print(response);
    //   return response;
    // }
  }

  Future<dynamic> categoryResp() async {
    String url = URLConstants.baseUrl +
        URLConstants.categoryUrl +
        "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";

    final response = await getDioRequest(url);
    // print(response);
    if (response != null) {
      return response;
    } else {
      // print(response);
      return response;
    }
  }

  Future<dynamic> subCategoryResp() async {
    String url = URLConstants.baseUrl +
        URLConstants.productUrl +
        "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";

    final response = await getDioRequest(url);
    print(response);
    if (response != null) {
      return response;
    } else {
      print(response);
      return response;
    }
  }
  //   try {
  //
  //     Response response = await Dio().get(url,
  //         // "https://liveprojects.co.in/goldgift/wp-json/wc/v3/products?consumer_key=ck_e574cd75f0fedf68fda0fa8fd99c17f54665a4c6&consumer_secret=cs_9e084118b1fdba78c85c24b6a209fdf382057e5e",
  //         options: Options(
  //             headers: {HttpHeaders.contentTypeHeader: "application/json"}));

  //     print(response.statusCode);
  //     // print(response.data[1]['id']);
  //     return response.data;
  //   } on Error catch (e) {
  //     print(e);
  //   }
  // }
}
