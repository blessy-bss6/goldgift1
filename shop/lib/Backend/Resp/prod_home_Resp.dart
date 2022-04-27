import '../Model/product.dart';
import '/utils/app_constants.dart';
import '/utils/http_services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ProdHomeRespo {
  Future<dynamic> prodResp() async {
    String url = URLConstants.baseUrl +
        URLConstants.productUrl +
        "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";

    final response = await http.get(Uri.parse(url));
    print(response.statusCode);

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      print(data);

      return data;

      // print(ProductModel.fromJson(jsonDecode(response.body)));
      // return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      // throw Exception('Failed to load album');
      return false;
    }

    // final response = await getDioRequest(url);
    // print(response);
    // if (response != null) {
    //   return response;
    // } else {
    //   // print(response);
    //   // return response;
    //   return false;
    // }
  }

  Future<dynamic> subprodResp({String? pageNum, String? categoryId}) async {
    // https: //liveprojects.co.in/goldgift/wp-json/wc/v3/products?per_page=10&category=152
    String url = URLConstants.baseUrl +
        URLConstants.productUrl +
        "?per_page=$pageNum&category=$categoryId"
            "&consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";

    // String url = URLConstants.baseUrl +
    //     URLConstants.productUrl +
    //     "?consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";

    final response = await getDioRequest(url);
    print(response);
    if (response != null) {
      return response;
    } else {
      // print(response);
      // return response;
      return false;
    }
  }
}
