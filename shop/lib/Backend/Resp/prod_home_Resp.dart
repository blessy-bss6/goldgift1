import '/utils/app_constants.dart';
import '/utils/http_services.dart';

class ProdHomeRespo {
  Future<dynamic> homeResp() async {
    final response = await getDioRequest(
      URLConstants.homeUrl,
    );
    print(response);
    if (response != null) {
      return response;
    } else {
      print(response);
      return response;
    }
  }

  Future<dynamic> prodResp() async {
    final response = await getDioRequest(
      URLConstants.prodUrl,
    );

    if (response != null) {
      return response;
    } else {
      print(response);
      return response;
    }
  }
}
