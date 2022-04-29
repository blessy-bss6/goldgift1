import '/utils/app_constants.dart';
import '/utils/http_services.dart';

class CategoryRespo {
  Future<dynamic> categoryResp({String? pageNum = '1'}) async {
    String url = URLConstants.baseUrl +
        URLConstants.categoryUrl+"?page=$pageNum"
  "&consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";
    // String url =
    //     "https://liveprojects.co.in/goldgift//wp-json/wc/v3/products/categories?page=1&consumer_key=ck_e574cd75f0fedf68fda0fa8fd99c17f54665a4c6&consumer_secret=cs_9e084118b1fdba78c85c24b6a209fdf382057e5e";
    final response = await getDioRequest(url);
    // print("response data  $response");
    if (response != null) {
      return response;
    } else {
      // print(response);
      // return response;
      return false;
    }
  }

  Future<dynamic> subCategoryResp({String? pageNum, String ?parent}) async {
    String url = URLConstants.baseUrl +
        URLConstants.categoryUrl + "?page=$pageNum&parent=$parent"
        "&consumer_key=${URLConstants.Key}&consumer_secret=${URLConstants.password}";

    final response = await getDioRequest(url);
    // print(response);
    if (response != null) {
      return response;
    } else {
      print(response);
      return response;
    }
  }
}
