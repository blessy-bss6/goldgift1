import 'dart:convert';

import 'package:dio/dio.dart';

class PaymentResp {
  var auth = 'Basic ' +
      base64Encode(
          utf8.encode('key:passeord'));

  Future<dynamic> paymentCapturedResp({
    dynamic  ammount,
    dynamic transcationId,
  }) async {
    try {
      Response response = await Dio().post(
          'https://api.razorpay.com/v1/payments/$transcationId/capture',
          data: {"amount": ammount * 100},
          options: Options(headers: <String, String>{'authorization': auth}));

      print(response);
    } on DioError catch (e) {
      print(e);
    }
  }

//  1 Refund Payment
  Future<dynamic> paymentRefundResp({
   dynamic ammount,
    dynamic transcationId,
  }) async {
    try {
      Response response = await Dio().post(
          'https://api.razorpay.com/v1/payments/$transcationId/refund',
          data: {"amount": ammount * 100},
          options: Options(headers: <String, String>{'authorization': auth}));

      print(response);
    } on DioError catch (e) {
      print(e);
    }
  }
}
